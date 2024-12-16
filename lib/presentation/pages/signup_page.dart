import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../data/auth_repository.dart';
import '../../domain/models/sign_up_user.dart';

class SignUpPage extends StatefulWidget {
  final Dio dio;
  const SignUpPage({super.key, required this.dio});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late AuthRepository _authRepository;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Gender _selectedGender = Gender.other;
  DateTime? _selectedDate;

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepository(widget.dio);
  }

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

    final user = SignUpUser(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      gender: _selectedGender,
      dateOfBirth: _selectedDate!,
    );

    final success = await _authRepository.signUp(user);

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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'Imię'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Nazwisko'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Hasło'),
              obscureText: true,
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
              child: Text(_selectedDate == null ? 'Wybierz datę urodzenia' : _selectedDate!.toIso8601String().split('T')[0]),
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
    );
  }
}
