// Openapi Generator last run: : 2024-12-16T07:38:42.226111
import 'package:flutter/material.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:praca_inzynierska_front/presentation/pages/login_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

@Openapi(
  additionalProperties:
  DioProperties(pubName: 'praca_inzynierska_api', pubAuthor: 'Maciej Wojturski'),
  inputSpec: InputSpec(path: 'lib/swaggers/contract.yml'),
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'api/praca_inzynierska_api',
)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikacja Uwierzytelniania',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}