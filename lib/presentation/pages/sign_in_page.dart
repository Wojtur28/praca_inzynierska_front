import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/models/sign_in_user.dart';
import '../../domain/repositories/auth_repository.dart';

class SignInPage extends StatefulWidget {
  final Dio dio;
  final ValueNotifier<ThemeMode> themeNotifier;

  const SignInPage({super.key, required this.dio, required this.themeNotifier});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final AuthRepository authRepository;

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(widget.dio);
  }

  Future<void> _login() async {
    try {
      final user = SignInUser(
        email: emailController.text,
        password: passwordController.text,
      );

      final success = await authRepository.signIn(user);
      if (success) {
        Navigator.pushReplacementNamed(context, '/games');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logowanie nie powiodło się.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nieprawidłowy email lub hasło.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logowanie'),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Zaloguj się'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: const Text('Nie masz konta? Zarejestruj się.'),
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

