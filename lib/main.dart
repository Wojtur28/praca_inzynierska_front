// Openapi Generator last run: : 2024-12-16T13:42:08.248089
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
import 'package:praca_inzynierska_front/presentation/pages/game_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/signin_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/signup_page.dart';

import 'data/auth_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authStorage = AuthStorage();
  final token = await authStorage.getToken();

  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));
  final bearerAuthInterceptor = BearerAuthInterceptor();
  dio.interceptors.add(bearerAuthInterceptor);

  if (token != null && token.isNotEmpty) {
    bearerAuthInterceptor.tokens['bearerAuth'] = token;
  }

  runApp(MyApp(
    initialRoute: token != null && token.isNotEmpty ? '/games' : '/signin',
    dio: dio,
  ));
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
  final String initialRoute;
  final Dio dio;

  const MyApp({super.key, required this.initialRoute, required this.dio});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikacja Uwierzytelniania',
      initialRoute: initialRoute,
      routes: {
        '/signin': (context) => SignInPage(dio: dio),
        '/signup': (context) => SignUpPage(dio: dio),
        '/games': (context) => GamesPage(dio: dio),
      },
    );
  }
}