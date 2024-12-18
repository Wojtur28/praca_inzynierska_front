import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../data/auth_repository.dart';
import '../../domain/models/sign_up_user.dart';

class SignUpPage extends StatefulWidget {
  final Dio dio;
  final ValueNotifier<ThemeMode> themeNotifier;

  const SignUpPage({super.key, required this.dio, required this.themeNotifier});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Gender _selectedGender = Gender.other;
  DateTime? _selectedDate;

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _signUp() async {
    if (_selectedDate == null) {
      setState(() {
        _errorMessage = 'Wybierz datę urodzenia';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final success = await AuthRepository(widget.dio).signUp(
      SignUpUser(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        gender: _selectedGender,
        dateOfBirth: _selectedDate!,
      ),
    );

    setState(() {
      _isLoading = false;
    });

    if (success) {
      Navigator.pushReplacementNamed(context, '/games');
    } else {
      setState(() {
        _errorMessage = 'Błąd podczas rejestracji';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zarejestruj się'),
        actions: [
          IconButton(
            icon: Icon(widget.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              widget.themeNotifier.value =
              widget.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
          ),
        ],
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_errorMessage != null)
                  Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(labelText: 'Imię'),
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(labelText: 'Nazwisko'),
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Hasło'),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButton<Gender>(
                  value: _selectedGender,
                  items: Gender.values.map((g) {
                    String label;
                    switch (g) {
                      case Gender.male:
                        label = 'Mężczyzna';
                        break;
                      case Gender.female:
                        label = 'Kobieta';
                        break;
                      default:
                        label = 'Inna';
                        break;
                    }
                    return DropdownMenuItem(value: g, child: Text(label));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      if (val != null) _selectedGender = val;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _pickDate,
                  child: Text(
                    _selectedDate == null
                        ? 'Wybierz datę urodzenia'
                        : _selectedDate!.toIso8601String().split('T')[0],
                  ),
                ),
                const SizedBox(height: 16),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _signUp,
                  child: const Text('Zarejestruj'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
