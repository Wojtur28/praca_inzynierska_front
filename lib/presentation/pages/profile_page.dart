import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

import '../../utils/game_status_translation.dart';

class ProfilePage extends StatefulWidget {
  final Dio dio;
  final UserApi userApi;
  final LibraryApi libraryApi;

  const ProfilePage({
    super.key,
    required this.dio,
    required this.userApi,
    required this.libraryApi,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;
  bool isEditing = false;
  User? currentUser;
  ModelLibrary? library;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String? _selectedGender;

  Map<String, int> tagCounts = {};
  Map<String, int> statusCounts = {};

  @override
  void initState() {
    super.initState();
    _loadProfileAndLibrary();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _loadProfileAndLibrary() async {
    try {
      final userResponse = await widget.userApi.getCurrentUser();
      setState(() {
        currentUser = userResponse.data;
        _firstNameController.text = currentUser?.firstName ?? '';
        _lastNameController.text = currentUser?.lastName ?? '';
        _selectedGender = currentUser?.gender;
      });

      final libraryResponse =
      await widget.libraryApi.getOrCreateLibraryForCurrentUser();
      setState(() {
        library = libraryResponse.data;
      });

      _processLibraryStatistics();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd pobierania danych: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _processLibraryStatistics() {
    if (library?.libraryItems == null) return;

    Map<String, int> tagsMap = {};
    for (var item in library!.libraryItems!) {
      if (item.steamGame?.tags != null) {
        List<String> tags =
        item.steamGame!.tags!.split(',').map((e) => e.trim()).toList();
        for (var tag in tags) {
          tagsMap[tag] = (tagsMap[tag] ?? 0) + 1;
        }
      }
    }

    var sortedTags = tagsMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    tagCounts = Map.fromEntries(sortedTags.take(5));

    Map<String, int> statuses = {
      'NOT_STARTED': 0,
      'IN_PROGRESS': 0,
      'COMPLETED': 0,
      'DROPPED': 0,
    };

    for (var item in library!.libraryItems!) {
      String status =
          item.gameStatus?.toString().split('.').last ?? 'NOT_STARTED';
      if (statuses.containsKey(status)) {
        statuses[status] = (statuses[status] ?? 0) + 1;
      }
    }
    statusCounts = statuses;
  }

  DateTime? _convertDateToDateTime(Date? date) {
    if (date == null) return null;
    return DateTime(date.year, date.month, date.day);
  }

  Future<void> _saveProfile() async {
    try {
      setState(() {
        isLoading = true;
      });

      final updateUser = UpdateUser((b) => b
        ..firstName = _firstNameController.text
        ..lastName = _lastNameController.text
        ..gender = _selectedGender);

      final response = await widget.userApi.updateCurrentUser(
        updateUser: updateUser,
      );

      setState(() {
        currentUser = response.data;
        isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil został zaktualizowany.')),
      );
    } catch (e) {
      print('Error updating profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd aktualizacji profilu: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildProfileView(BuildContext context, BoxConstraints constraints) {
    bool isWide = constraints.maxWidth > 800;

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 32 : 16,
            vertical: 32,
          ),
          child: isWide
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isEditing = true;
                                    });
                                  },
                                  icon: const Icon(Icons.edit),
                                  label: const Text('Edytuj profil'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    elevation: 4,
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/library');
                                  },
                                  icon: const Icon(Icons.library_books),
                                  label: const Text('Biblioteka'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    elevation: 4,
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            _buildUserInfo(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: _buildStatisticsCharts(),
                  ),
                ),
              ),
            ],
          )
              : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        isEditing = true;
                      });
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edytuj profil'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      elevation: 4,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/library');
                    },
                    icon: const Icon(Icons.library_books),
                    label: const Text('Biblioteka'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      elevation: 4,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: _buildUserInfo(),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: _buildStatisticsCharts(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('Email'),
          subtitle: Text(currentUser!.email ?? ''),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Imię'),
          subtitle: Text(currentUser!.firstName ?? ''),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text('Nazwisko'),
          subtitle: Text(currentUser!.lastName ?? ''),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.wc),
          title: const Text('Płeć'),
          subtitle: Text(
              gameStatusTranslation[currentUser!.gender ?? ''] ?? currentUser!.gender ?? ''),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.cake),
          title: const Text('Data urodzenia'),
          subtitle: Text(
            currentUser!.dateOfBirth != null
                ? DateFormat('yyyy-MM-dd').format(_convertDateToDateTime(currentUser!.dateOfBirth!)!)
                : '',
          ),
        ),
      ],
    );
  }

  Widget _buildProfileEditView(BuildContext context, BoxConstraints constraints) {
    bool isWide = constraints.maxWidth > 800;

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 32 : 16,
            vertical: 32,
          ),
          child: isWide
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isEditing = true;
                                    });
                                  },
                                  icon: const Icon(Icons.edit),
                                  label: const Text('Edytuj profil'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    elevation: 4,
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/library');
                                  },
                                  icon: const Icon(Icons.library_books),
                                  label: const Text('Biblioteka'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    elevation: 4,
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            _buildEditForm(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: _buildStatisticsCharts(),
                  ),
                ),
              ),
            ],
          )
              : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        isEditing = true;
                      });
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edytuj profil'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      elevation: 4,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/library');
                    },
                    icon: const Icon(Icons.library_books),
                    label: const Text('Biblioteka'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      elevation: 4,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: _buildEditForm(),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: _buildStatisticsCharts(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditForm() {
    return Column(
      children: [
        TextField(
          controller: _firstNameController,
          decoration: const InputDecoration(
            labelText: 'Imię',
            icon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _lastNameController,
          decoration: const InputDecoration(
            labelText: 'Nazwisko',
            icon: Icon(Icons.person_outline),
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _selectedGender,
          decoration: const InputDecoration(
            labelText: 'Płeć',
            icon: Icon(Icons.wc),
          ),
          items: <String>['MALE', 'FEMALE', 'OTHER']
              .map<DropdownMenuItem<String>>((String value) {
            String label;
            switch (value) {
              case 'MALE':
                label = 'Mężczyzna';
                break;
              case 'FEMALE':
                label = 'Kobieta';
                break;
              case 'OTHER':
                label = 'Inne';
                break;
              default:
                label = 'Nieokreślona';
            }
            return DropdownMenuItem<String>(
              value: value,
              child: Text(label),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Zapisz'),
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                elevation: 4,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditing = false;
                  _firstNameController.text = currentUser?.firstName ?? '';
                  _lastNameController.text = currentUser?.lastName ?? '';
                  _selectedGender = currentUser?.gender;
                });
              },
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                elevation: 4,
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Anuluj'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatisticsCharts() {
    return Column(
      children: [
        const Text(
          'Statystyki Biblioteki',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Column(
          children: [
            const Text(
              'Top 5 Tagów',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: (tagCounts.values.isNotEmpty)
                      ? tagCounts.values
                      .reduce((a, b) => a > b ? a : b)
                      .toDouble() +
                      1
                      : 10,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          int index = value.toInt();
                          if (index >= 0 && index < tagCounts.keys.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                tagCounts.keys.elementAt(index),
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: tagCounts.entries
                      .toList()
                      .asMap()
                      .entries
                      .map((entry) {
                    int idx = entry.key;
                    var tag = entry.value.key;
                    var count = entry.value.value;
                    return BarChartGroupData(
                      x: idx,
                      barRods: [
                        BarChartRodData(
                          toY: count.toDouble(),
                          color: Colors.blue,
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            const Text(
              'Proporcje Statusów Gier',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: statusCounts.entries.map((entry) {
                    String status = entry.key;
                    int count = entry.value;
                    double percentage = statusCounts.values.fold(
                        0, (previousValue, element) => previousValue + element) >
                        0
                        ? (count /
                        statusCounts.values.fold(
                            0, (a, b) => a + b)) *
                        100
                        : 0;
                    Color color;
                    switch (status) {
                      case 'NOT_STARTED':
                        color = Colors.grey;
                        break;
                      case 'IN_PROGRESS':
                        color = Colors.blue;
                        break;
                      case 'COMPLETED':
                        color = Colors.green;
                        break;
                      case 'DROPPED':
                        color = Colors.red;
                        break;
                      default:
                        color = Colors.grey;
                    }
                    return PieChartSectionData(
                      color: color,
                      value: count.toDouble(),
                      title: percentage > 0
                          ? '${percentage.toStringAsFixed(1)}%'
                          : '',
                      radius: 100,
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: statusCounts.keys.map((status) {
                Color color;
                switch (status) {
                  case 'NOT_STARTED':
                    color = Colors.grey;
                    break;
                  case 'IN_PROGRESS':
                    color = Colors.blue;
                    break;
                  case 'COMPLETED':
                    color = Colors.green;
                    break;
                  case 'DROPPED':
                    color = Colors.red;
                    break;
                  default:
                    color = Colors.grey;
                }
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 16, height: 16, color: color),
                    const SizedBox(width: 4),
                    Text(gameStatusTranslation[status] ?? status),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return isEditing
              ? _buildProfileEditView(context, constraints)
              : _buildProfileView(context, constraints);
        },
      ),
    );
  }
}
