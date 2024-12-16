import 'package:flutter/material.dart';

import '../../domain/models/sign_up_user.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Gender _selectedGender = Gender.other;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _firstNameController,
          decoration: const InputDecoration(
            labelText: 'Imię',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _lastNameController,
          decoration: const InputDecoration(
            labelText: 'Nazwisko',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
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
        const SizedBox(height: 16.0),
        DropdownButtonFormField<Gender>(
          value: _selectedGender,
          decoration: const InputDecoration(
            labelText: 'Płeć',
            border: OutlineInputBorder(),
          ),
          items: Gender.values.map((gender) {
            return DropdownMenuItem(
              value: gender,
              child: Text(
                gender == Gender.male
                    ? 'Mężczyzna'
                    : gender == Gender.female
                    ? 'Kobieta'
                    : 'Inna',
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              if (value != null) _selectedGender = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () async {
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
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
          ),
          child: Text(
            _selectedDate == null
                ? 'Wybierz datę urodzin'
                : 'Data: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
          ),
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              if (_selectedDate != null) {
                final newUser = SignUpUser(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  gender: _selectedGender,
                  dateOfBirth: _selectedDate!,
                );
                // Wywołaj logikę signUp
              }
            },
            child: const Text('Zarejestruj się'),
          ),
        ),
      ],
    );
  }
}
