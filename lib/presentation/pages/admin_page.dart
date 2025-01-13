import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _loadUsers();
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

  void _showEditUserDialog(User user) {
    Map<String, bool> selectedRoles = {
      'Użytkownik': false,
      'Administrator': false,
      'Analityk': false,
    };
    if (user.roles != null && user.roles!.isNotEmpty) {
      for (var role in user.roles!.toList()) {
        if (role == 'ROLE_ADMIN') {
          selectedRoles['Administrator'] = true;
        } else if (role == 'ROLE_ANALYST') {
          selectedRoles['Analityk'] = true;
        } else if (role == 'ROLE_USER') {
          selectedRoles['Użytkownik'] = true;
        }
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
              onPressed: () {
                Navigator.pop(context);
              },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Administratora - Zarządzanie Użytkownikami'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : (users == null || users!.isEmpty)
          ? const Center(child: Text('Brak użytkowników'))
          : ListView.builder(
        itemCount: users!.length,
        itemBuilder: (context, index) {
          final user = users![index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(user.email.toString()),
              subtitle: Text(
                'ID: ${user.id}\n'
                    'Imię: ${user.firstName}\n'
                    'Nazwisko: ${user.lastName}\n'
                    'Płeć: ${user.gender}\n'
                    'Data urodzenia: ${user.dateOfBirth}\n'
                    'Role: ${user.roles?.toList().join(', ') ?? 'brak'}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _showEditUserDialog(user),
                    tooltip: 'Edytuj użytkownika',
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _confirmDeleteUser(user),
                    tooltip: 'Usuń użytkownika',
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadUsers,
        tooltip: 'Odśwież',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
