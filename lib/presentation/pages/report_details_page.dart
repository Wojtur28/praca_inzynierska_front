import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

class ReportDetailPage extends StatefulWidget {
  final Dio dio;
  final ReportApi reportApi;
  final String reportId;

  const ReportDetailPage({
    super.key,
    required this.dio,
    required this.reportApi,
    required this.reportId,
  });

  @override
  State<ReportDetailPage> createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage> {
  bool isLoading = true;
  ReportDetails? report;
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  final DateFormat dateTimeFormat = DateFormat('dd-MM-yyyy HH:mm');

  @override
  void initState() {
    super.initState();
    _fetchReport();
  }

  Future<void> _fetchReport() async {
    try {
      final response = await widget.reportApi.getReport(reportId: widget.reportId);
      setState(() {
        report = response.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd pobierania raportu: $e'))
      );
    }
  }

  String bucketForScore(double score) {
    if (score < 0.6) return "Negative";
    if (score < 0.7) return "Mixed";
    if (score < 0.8) return "Mostly Positive";
    if (score < 0.9) return "Positive";
    return "Very Positive";
  }

  Widget _buildReportDetail() {
    String reportName = report?.name ?? 'Brak nazwy';
    String period = 'Okres: ' +
        (report?.startDate != null ? dateFormat.format(report!.startDate!.toDateTime()) : '-') +
        ' - ' +
        (report?.endDate != null ? dateFormat.format(report!.endDate!.toDateTime()) : '-');
    String status = 'Status: ${report?.reportStatus ?? '-'}';
    String created = 'Utworzony: ' + (report?.createdAt != null ? dateTimeFormat.format(report!.createdAt!) : '-');
    String updated = 'Zaktualizowany: ' + (report?.updatedAt != null ? dateTimeFormat.format(report!.updatedAt!) : '-');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            color: Theme.of(context).cardColor,
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reportName, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(period, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Text(status, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Text(created, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Text(updated, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ),
          if (report?.reportType == 'RATING') ..._buildRatingContent(),
          if (report?.reportType == 'GAME') ..._buildGameContent(),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Wróć do listy raportów'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildRatingContent() {
    int ratingsCount = report?.gameRatings?.length ?? 0;
    double averageRating = 0;
    int minRating = 0, maxRating = 0;
    Map<int, int> ratingDistribution = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    if (ratingsCount > 0) {
      List<int> ratings = report!.gameRatings!.map((r) => r.rating ?? 0).toList();
      averageRating = ratings.reduce((a, b) => a + b) / ratings.length;
      minRating = ratings.reduce((a, b) => a < b ? a : b);
      maxRating = ratings.reduce((a, b) => a > b ? a : b);
      for (var rate in ratings) {
        if (ratingDistribution.containsKey(rate)) {
          ratingDistribution[rate] = ratingDistribution[rate]! + 1;
        }
      }
    }
    return [
      Card(
        color: Theme.of(context).cardColor,
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Podsumowanie recenzji', style: Theme.of(context).textTheme.titleMedium),
              const Divider(),
              _buildSummaryTile('Liczba recenzji', ratingsCount.toString()),
              if (ratingsCount > 0) ...[
                _buildSummaryTile('Średnia ocena', averageRating.toStringAsFixed(2)),
                _buildSummaryTile('Najniższa ocena', minRating.toString()),
                _buildSummaryTile('Najwyższa ocena', maxRating.toString()),
              ],
            ],
          ),
        ),
      ),
      if (ratingsCount > 0)
        Card(
          color: Theme.of(context).cardColor,
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rozkład ocen', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: _buildRatingChart(ratingDistribution),
                )
              ],
            ),
          ),
        )
    ];
  }

  List<Widget> _buildGameContent() {
    Map<String, int> scoreBucketDistribution = {};
    Map<int, int> releaseYearDistribution = {};
    if (report?.steamGames != null) {
      for (var game in report!.steamGames!) {
        if (game.reviewsScoreFancy != null) {
          double? score = double.tryParse(game.reviewsScoreFancy!);
          String bucket;
          if (score != null) {
            bucket = bucketForScore(score);
          } else {
            bucket = "Unknown";
          }
          scoreBucketDistribution[bucket] = (scoreBucketDistribution[bucket] ?? 0) + 1;
        }
        if (game.releaseDate != null) {
          DateTime releaseDate = game.releaseDate!.toDateTime();
          int year = releaseDate.year;
          releaseYearDistribution[year] = (releaseYearDistribution[year] ?? 0) + 1;
        }
      }
    }
    return [
      Card(
        color: Theme.of(context).cardColor,
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Podsumowanie gier', style: Theme.of(context).textTheme.titleMedium),
              const Divider(),
              _buildSummaryTile('Liczba gier', (report?.steamGames?.length ?? 0).toString()),
            ],
          ),
        ),
      ),
      Card(
        color: Theme.of(context).cardColor,
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rozkład ocen (reviewsScoreFancy)', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: _buildScorePieChart(scoreBucketDistribution),
              )
            ],
          ),
        ),
      ),
      Card(
        color: Theme.of(context).cardColor,
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Liczba gier wg. roku premiery', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: _buildReleaseYearBarChart(releaseYearDistribution),
              )
            ],
          ),
        ),
      )
    ];
  }

  Widget _buildSummaryTile(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget _buildRatingChart(Map<int, int> distribution) {
    int maxFrequency = distribution.values.isEmpty ? 1 : distribution.values.reduce((a, b) => a > b ? a : b);
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: (maxFrequency + 1).toDouble(),
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(value.toInt().toString(), style: const TextStyle(fontSize: 12)),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12));
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: distribution.entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value.toDouble(),
                width: 16,
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              )
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildScorePieChart(Map<String, int> distribution) {
    if (distribution.isEmpty) return const Center(child: Text('Brak danych'));
    int total = distribution.values.fold(0, (sum, value) => sum + value);
    List<PieChartSectionData> sections = [];
    int i = 0;
    distribution.forEach((key, value) {
      final double percentage = total == 0 ? 0 : (value / total) * 100;
      sections.add(PieChartSectionData(
        value: value.toDouble(),
        title: '$key\n${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        color: Colors.primaries[i % Colors.primaries.length],
      ));
      i++;
    });
    return PieChart(
      PieChartData(
        sections: sections,
        centerSpaceRadius: 40,
        sectionsSpace: 2,
        borderData: FlBorderData(show: false),
      ),
    );
  }

  Widget _buildReleaseYearBarChart(Map<int, int> distribution) {
    if (distribution.isEmpty) return const Center(child: Text('Brak danych'));
    List<int> years = distribution.keys.toList()..sort();
    int maxCount = distribution.values.reduce((a, b) => a > b ? a : b);
    double interval = maxCount <= 5 ? 1 : (maxCount / 5).ceilToDouble();
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: (maxCount + interval).toDouble(),
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                int index = value.toInt();
                if (index < 0 || index >= years.length) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(years[index].toString(), style: const TextStyle(fontSize: 10)),
                );
              },
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: interval,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12));
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(years.length, (index) {
          int count = distribution[years[index]]!;
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: count.toDouble(),
                width: 16,
                borderRadius: BorderRadius.circular(4),
                color: Colors.purple,
              )
            ],
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Szczegóły Raportu'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : _buildReportDetail(),
        ],
      ),
    );
  }
}
