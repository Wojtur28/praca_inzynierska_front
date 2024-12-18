import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/auth_repository.dart';
import '../../domain/models/sign_in_user.dart';

class SignInPage extends StatefulWidget {
  final Dio dio;
  final ValueNotifier<ThemeMode> themeNotifier;

  const SignInPage({super.key, required this.dio, required this.themeNotifier});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final success = await AuthRepository(widget.dio).signIn(
      SignInUser(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );

    setState(() {
      _isLoading = false;
    });

    if (success) {
      Navigator.pushReplacementNamed(context, '/games');
    } else {
      setState(() {
        _errorMessage = 'Błędne dane logowania';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zaloguj się'),
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
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _signIn,
                  child: const Text('Zaloguj'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text('Nie masz konta? Zarejestruj się'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
