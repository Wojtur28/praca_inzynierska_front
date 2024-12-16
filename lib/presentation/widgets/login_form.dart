import 'package:flutter/material.dart';

import '../../domain/models/sign_in_user.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            labelText: 'Hasło',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              final user = SignInUser(
                email: _emailController.text,
                password: _passwordController.text,
              );
              // Wywołaj logikę signIn
            },
            child: const Text('Zaloguj się'),
          ),
        ),
      ],
    );
  }
}
