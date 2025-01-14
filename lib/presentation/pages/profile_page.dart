import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

class ProfilePage extends StatefulWidget {
  final Dio dio;
  final UserApi userApi;

  const ProfilePage({
    super.key,
    required this.dio,
    required this.userApi,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;
  User? currentUser;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    try {
      final response = await widget.userApi.getCurrentUser();
      setState(() {
        currentUser = response.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd pobierania danych profilu: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : currentUser == null
        ? const Center(child: Text('Brak danych profilu'))
        : Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 420, vertical: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Profil użytkownika',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
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
                subtitle: Text(currentUser!.gender ?? ''),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.cake),
                title: const Text('Data urodzenia'),
                subtitle: Text(
                    currentUser!.dateOfBirth?.toString() ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
