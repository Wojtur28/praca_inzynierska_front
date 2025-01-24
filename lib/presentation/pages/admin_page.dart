import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';


class AdminPanelPage extends StatefulWidget {
  final Dio dio;
  final UserApi userApi;

  const AdminPanelPage({
    super.key,
    required this.dio,
    required this.userApi,
  });

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  bool isLoading = true;
  BuiltList<User>? users;
  String searchQuery = '';
  int? sortColumnIndex;
  bool isAscending = true;

  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  DateTime _toDateTime(Date? date) {
    if (date == null) return DateTime(1900);
    return DateTime(date.year, date.month, date.day);
  }

  Future<void> _loadUsers() async {
    try {
      final response = await widget.userApi.getUsers();
      setState(() {
        users = response.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd pobierania użytkowników: $e')),
      );
    }
  }

  List<User> get filteredUsers {
    if (users == null) return [];
    if (searchQuery.isEmpty) return users!.toList();
    return users!
        .where((u) =>
    (u.email?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false) ||
        (u.id?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false) ||
        (u.firstName?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false) ||
        (u.lastName?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false) ||
        (u.gender?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false))
        .toList();
  }

  void _onSort<T>(Comparable<T>? Function(User user) getField, int columnIndex, bool ascending) {
    final List<User> usersList = filteredUsers;
    usersList.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      if (aValue == null || bValue == null) return 0;
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
      users = BuiltList<User>(usersList);
    });
  }

  String _mapRole(String role) {
    switch (role) {
      case 'ROLE_ADMIN':
        return 'Administrator';
      case 'ROLE_ANALYST':
        return 'Analityk';
      case 'ROLE_USER':
      default:
        return 'Użytkownik';
    }
  }

  void _showEditUserDialog(User user) {
    Map<String, bool> selectedRoles = {
      'Użytkownik': false,
      'Administrator': false,
      'Analityk': false,
    };
    if (user.roles != null && user.roles!.isNotEmpty) {
      for (var role in user.roles!.toList()) {
        if (role == 'ROLE_ADMIN') selectedRoles['Administrator'] = true;
        else if (role == 'ROLE_ANALYST') selectedRoles['Analityk'] = true;
        else if (role == 'ROLE_USER') selectedRoles['Użytkownik'] = true;
      }
    } else {
      selectedRoles['Użytkownik'] = true;
    }
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setStateDialog) {
          return AlertDialog(
            title: Text('Edycja użytkownika: ${user.email}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckboxListTile(
                  title: const Text('Użytkownik'),
                  value: selectedRoles['Użytkownik'],
                  onChanged: (value) {
                    setStateDialog(() {
                      selectedRoles['Użytkownik'] = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Administrator'),
                  value: selectedRoles['Administrator'],
                  onChanged: (value) {
                    setStateDialog(() {
                      selectedRoles['Administrator'] = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Analityk'),
                  value: selectedRoles['Analityk'],
                  onChanged: (value) {
                    setStateDialog(() {
                      selectedRoles['Analityk'] = value ?? false;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Anuluj'),
              ),
              ElevatedButton(
                onPressed: () async {
                  List<String> roles = [];
                  if (selectedRoles['Użytkownik'] == true) roles.add('ROLE_USER');
                  if (selectedRoles['Administrator'] == true) roles.add('ROLE_ADMIN');
                  if (selectedRoles['Analityk'] == true) roles.add('ROLE_ANALYST');
                  final updatedUser = user.rebuild((b) => b..roles.replace(roles));
                  try {
                    await widget.userApi.updateUser(
                      userId: user.id.toString(),
                      user: updatedUser,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Użytkownik został zaktualizowany.')),
                    );
                    Navigator.pop(context);
                    _loadUsers();
                  } catch (e) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Błąd aktualizacji użytkownika: $e')),
                    );
                  }
                },
                child: const Text('Zapisz'),
              ),
            ],
          );
        });
      },
    );
  }

  void _confirmDeleteUser(User user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Usuń użytkownika'),
          content: Text('Czy na pewno chcesz usunąć użytkownika ${user.email}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Anuluj'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await widget.userApi.deleteUser(userId: user.id.toString());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Użytkownik został usunięty.')),
                  );
                  Navigator.pop(context);
                  _loadUsers();
                } catch (e) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Błąd usuwania użytkownika: $e')),
                  );
                }
              },
              child: const Text('Usuń'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: sortColumnIndex,
        sortAscending: isAscending,
        columns: [
          DataColumn(
            label: const Text('ID'),
            onSort: (columnIndex, ascending) =>
                _onSort<String>((user) => user.id, columnIndex, ascending),
          ),
          DataColumn(
            label: const Text('Email'),
            onSort: (columnIndex, ascending) =>
                _onSort<String>((user) => user.email, columnIndex, ascending),
          ),
          DataColumn(
            label: const Text('Imię'),
            onSort: (columnIndex, ascending) =>
                _onSort<String>((user) => user.firstName, columnIndex, ascending),
          ),
          DataColumn(
            label: const Text('Nazwisko'),
            onSort: (columnIndex, ascending) =>
                _onSort<String>((user) => user.lastName, columnIndex, ascending),
          ),
          DataColumn(
            label: const Text('Płeć'),
            onSort: (columnIndex, ascending) =>
                _onSort<String>((user) => user.gender, columnIndex, ascending),
          ),
          DataColumn(
            label: const Text('Data urodzenia'),
            onSort: (columnIndex, ascending) => _onSort<DateTime>(
                  (user) => user.dateOfBirth != null ? _toDateTime(user.dateOfBirth) : DateTime(1900),
              columnIndex,
              ascending,
            ),
          ),
          const DataColumn(label: Text('Role')),
          const DataColumn(label: Text('Akcje')),
        ],
        rows: filteredUsers.map((user) {
          final mappedRoles = user.roles?.toList().map(_mapRole).join(', ') ?? '';
          return DataRow(
            cells: [
              DataCell(Text(user.id ?? '')),
              DataCell(Text(user.email ?? '')),
              DataCell(Text(user.firstName ?? '')),
              DataCell(Text(user.lastName ?? '')),
              DataCell(Text(user.gender ?? '')),
              DataCell(Text(user.dateOfBirth != null
                  ? _dateFormat.format(_toDateTime(user.dateOfBirth))
                  : '')),
              DataCell(Text(mappedRoles)),
              DataCell(Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    tooltip: 'Edytuj użytkownika',
                    onPressed: () => _showEditUserDialog(user),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Usuń użytkownika',
                    onPressed: () => _confirmDeleteUser(user),
                  ),
                ],
              )),
            ],
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Szukaj',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(child: _buildDataTable()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadUsers,
        tooltip: 'Odśwież',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
