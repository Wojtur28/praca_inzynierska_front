import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

import 'package:intl/intl.dart';
import 'package:praca_inzynierska_front/presentation/pages/report_details_page.dart';

enum ReportType { rating, game }

class ReportsPage extends StatefulWidget {
  final Dio dio;
  final ReportApi reportApi;

  const ReportsPage({
    super.key,
    required this.dio,
    required this.reportApi,
  });

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  bool isLoading = true;
  BuiltList<Report>? reports;
  int currentPage = 0;
  final int pageSize = 5;
  int? sortColumnIndex;
  bool isAscending = true;
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  final DateFormat dateTimeFormat = DateFormat('dd-MM-yyyy HH:mm');

  @override
  void initState() {
    super.initState();
    _fetchReports();
  }

  Future<void> _fetchReports() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
      await widget.reportApi.getReports(page: currentPage, size: pageSize);
      final fetchedReports = response.data;
      if ((fetchedReports == null || fetchedReports.isEmpty) && currentPage > 0) {
        setState(() {
          currentPage--;
        });
        await _fetchReports();
      } else {
        setState(() {
          reports = BuiltList<Report>(fetchedReports ?? []);
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd pobierania raportów: $e')));
    }
  }

  Future<void> _refreshReports() async {
    setState(() {
      isLoading = true;
    });
    try {
      await widget.reportApi.refreshReportsCache();
      await _fetchReports();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Raporty zostały odświeżone.')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Błąd odświeżania raportów: $e')));
    }
  }

  void _sort<T>(Comparable<T>? Function(Report report) getField, int columnIndex, bool ascending) {
    final List<Report> sortedReports = reports!.toList();
    sortedReports.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      if (aValue == null || bValue == null) return 0;
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
      reports = BuiltList<Report>(sortedReports);
    });
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: sortColumnIndex,
        sortAscending: isAscending,
        columns: [
          DataColumn(
            label: const Text('Nazwa'),
            onSort: (index, ascending) {
              _sort<String>((report) => report.name ?? '', index, ascending);
            },
          ),
          DataColumn(
            label: const Text('Data startu'),
            onSort: (index, ascending) {
              _sort<DateTime>(
                    (report) =>
                report.startDate != null ? report.startDate!.toDateTime() : DateTime(1900),
                index,
                ascending,
              );
            },
          ),
          DataColumn(
            label: const Text('Data końca'),
            onSort: (index, ascending) {
              _sort<DateTime>(
                    (report) =>
                report.endDate != null ? report.endDate!.toDateTime() : DateTime(1900),
                index,
                ascending,
              );
            },
          ),
          DataColumn(
            label: const Text('Status'),
            onSort: (index, ascending) {
              _sort<String>((report) => report.reportStatus ?? '', index, ascending);
            },
          ),
          DataColumn(
            label: const Text('Utworzony'),
            onSort: (index, ascending) {
              _sort<DateTime>(
                    (report) => report.createdAt ?? DateTime(1900),
                index,
                ascending,
              );
            },
          ),
          DataColumn(
            label: const Text('Zaktualizowany'),
            onSort: (index, ascending) {
              _sort<DateTime>(
                    (report) => report.updatedAt ?? DateTime(1900),
                index,
                ascending,
              );
            },
          ),
          const DataColumn(label: Text('Akcje')),
        ],
        rows: reports!.map((report) {
          return DataRow(cells: [
            DataCell(Text(report.name ?? '')),
            DataCell(Text(report.startDate != null
                ? dateFormat.format(report.startDate!.toDateTime())
                : '-')),
            DataCell(Text(report.endDate != null
                ? dateFormat.format(report.endDate!.toDateTime())
                : '-')),
            DataCell(Text(report.reportStatus ?? '-')),
            DataCell(Text(report.createdAt != null
                ? dateTimeFormat.format(report.createdAt!)
                : '-')),
            DataCell(Text(report.updatedAt != null
                ? dateTimeFormat.format(report.updatedAt!)
                : '-')),
            DataCell(
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      if (report.id != null) {
                        _deleteReport(report.id!);
                      }
                    },
                  ),
                  if (report.reportStatus == 'FINISHED')
                    IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                      onPressed: () {
                        if (report.id != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportDetailPage(
                                dio: widget.dio,
                                reportApi: widget.reportApi,
                                reportId: report.id!,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                ],
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  Future<void> _deleteReport(String reportId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Usuń raport'),
        content: const Text('Czy na pewno chcesz usunąć ten raport?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Anuluj'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      try {
        await widget.reportApi.deleteReport(reportId: reportId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Raport został usunięty.')),
        );
        await _fetchReports();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd usuwania raportu: $e')),
        );
      }
    }
  }

  Future<void> _createReport() async {
    final nameController = TextEditingController();
    DateTime? startDate;
    DateTime? endDate;
    ReportType selectedReportType = ReportType.rating;
    final formKey = GlobalKey<FormState>();

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setStateDialog) {
          return AlertDialog(
            title: const Text('Stwórz nowy raport'),
            content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Nazwa raportu'),
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Wprowadź nazwę raportu' : null,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        startDate == null
                            ? 'Wybierz datę początkową'
                            : 'Start: ${dateFormat.format(startDate!)}',
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setStateDialog(() {
                            startDate = picked;
                          });
                        }
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        endDate == null
                            ? 'Wybierz datę końcową'
                            : 'Koniec: ${dateFormat.format(endDate!)}',
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setStateDialog(() {
                            endDate = picked;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text('Wybierz typ raportu'),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Raport ocen'),
                      leading: Radio<ReportType>(
                        value: ReportType.rating,
                        groupValue: selectedReportType,
                        onChanged: (ReportType? value) {
                          if (value != null) {
                            setStateDialog(() {
                              selectedReportType = value;
                            });
                          }
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Raport gier'),
                      leading: Radio<ReportType>(
                        value: ReportType.game,
                        groupValue: selectedReportType,
                        onChanged: (ReportType? value) {
                          if (value != null) {
                            setStateDialog(() {
                              selectedReportType = value;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (startDate != null || endDate != null)
                      Text(
                        'Wybrane daty: ${startDate != null ? dateFormat.format(startDate!) : "-"} - ${endDate != null ? dateFormat.format(endDate!) : "-"}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Anuluj'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate() && startDate != null && endDate != null) {
                    final report = Report((b) => b
                      ..name = nameController.text
                      ..startDate = startDate!.toDate()
                      ..endDate = endDate!.toDate()
                      ..reportStatus = 'IN_PROGRESS'
                      ..reportType = selectedReportType == ReportType.rating ? 'RATING' : 'GAME'
                    );
                    try {
                      Navigator.of(context).pop();
                      await widget.reportApi.createReport(report: report);
                      await _fetchReports();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Raport został stworzony.')),
                      );
                    } catch (e) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Błąd tworzenia raportu: $e')),
                      );
                    }
                  }
                },
                child: const Text('Stwórz'),
              ),
            ],
          );
        });
      },
    );
  }

  Widget _buildPaginationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: currentPage > 0
              ? () {
            setState(() {
              currentPage--;
              _fetchReports();
            });
          }
              : null,
          child: const Text('Poprzednia'),
        ),
        const SizedBox(width: 16),
        Text('Strona ${currentPage + 1}'),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: (reports != null && reports!.length == pageSize)
              ? () {
            setState(() {
              currentPage++;
              _fetchReports();
            });
          }
              : null,
          child: const Text('Następna'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raporty'),
      ),
      body: Stack(
        children: [
          isLoading
              ? const SizedBox.shrink()
              : (reports == null || reports!.isEmpty)
              ? const Center(child: Text('Brak raportów'))
              : Column(
            children: [
              Expanded(child: _buildDataTable()),
              _buildPaginationControls(),
              const SizedBox(height: 16),
            ],
          ),
          if (isLoading)
            Container(
              color: Colors.black54,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'refresh',
              onPressed: _refreshReports,
              tooltip: 'Odśwież raporty',
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              heroTag: 'add',
              onPressed: _createReport,
              tooltip: 'Stwórz raport',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
