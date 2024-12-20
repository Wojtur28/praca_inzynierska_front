import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/models/sign_up_user.dart';
import '../../domain/repositories/auth_repository.dart';

class SignUpPage extends StatefulWidget {
  final Dio dio;
  final ValueNotifier<ThemeMode> themeNotifier;

  const SignUpPage({super.key, required this.dio, required this.themeNotifier});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Gender selectedGender = Gender.male;
  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedYear = 2000;
  late final AuthRepository authRepository;

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(widget.dio);
  }

  Future<void> _register() async {
    try {
      final user = SignUpUser(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        gender: selectedGender,
        dateOfBirth: DateTime(selectedYear, selectedMonth, selectedDay),
      );

      final success = await authRepository.signUp(user);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rejestracja zakończona sukcesem!')),
        );
        Navigator.pushReplacementNamed(context, '/signin');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email już istnieje lub wystąpił błąd.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rejestracja'),
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
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'Imię',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Nazwisko',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Hasło',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Dzień', style: TextStyle(fontSize: 12)),
                          DropdownButton<int>(
                            value: selectedDay,
                            onChanged: (value) {
                              setState(() {
                                selectedDay = value!;
                              });
                            },
                            items: List.generate(31, (index) => index + 1)
                                .map((day) => DropdownMenuItem(
                              value: day,
                              child: Text(day.toString()),
                            ))
                                .toList(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Miesiąc', style: TextStyle(fontSize: 12)),
                          DropdownButton<int>(
                            value: selectedMonth,
                            onChanged: (value) {
                              setState(() {
                                selectedMonth = value!;
                              });
                            },
                            items: List.generate(12, (index) => index + 1)
                                .map((month) => DropdownMenuItem(
                              value: month,
                              child: Text(month.toString()),
                            ))
                                .toList(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Rok', style: TextStyle(fontSize: 12)),
                          DropdownButton<int>(
                            value: selectedYear,
                            onChanged: (value) {
                              setState(() {
                                selectedYear = value!;
                              });
                            },
                            items: List.generate(100, (index) => 1920 + index)
                                .map((year) => DropdownMenuItem(
                              value: year,
                              child: Text(year.toString()),
                            ))
                                .toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _register,
                    child: const Text('Zarejestruj się'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
                    child: const Text('Masz już konto? Zaloguj się.'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

