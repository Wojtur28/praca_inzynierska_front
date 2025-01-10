// Openapi Generator last run: : 2025-01-10T08:16:12.903636
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
import 'package:praca_inzynierska_front/presentation/pages/game_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/sign_in_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/sign_up_page.dart';

import 'auth/CustomAuthInterceptor.dart';
import 'data/auth_storage.dart';
import 'domain/repositories/auth_repository.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authStorage = AuthStorage();
  final token = await authStorage.getToken();

  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));
  final bearerAuthInterceptor = BearerAuthInterceptor();
  dio.interceptors.add(CustomAuthInterceptor(authStorage: authStorage));
  dio.interceptors.add(bearerAuthInterceptor);

  if (token != null && token.isNotEmpty) {
    bearerAuthInterceptor.tokens['bearerAuth'] = token;
  }

  final authRepository = AuthRepository(dio);

  runApp(MyApp(
    initialRoute: token != null && token.isNotEmpty ? '/games' : '/signin',
    dio: dio,
    navigatorKey: navigatorKey,
    authRepository: authRepository,
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
class MyApp extends StatefulWidget {
  final String initialRoute;
  final Dio dio;
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthRepository authRepository;

  const MyApp({super.key, required this.initialRoute, required this.dio, required this.navigatorKey, required this.authRepository});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Praca inżynierska',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          initialRoute: widget.initialRoute,
          routes: {
            '/signin': (context) => SignInPage(dio: widget.dio, themeNotifier: _themeNotifier),
            '/signup': (context) => SignUpPage(dio: widget.dio, themeNotifier: _themeNotifier),
            '/games': (context) => GamesPage(dio: widget.dio, themeNotifier: _themeNotifier, authRepository: widget.authRepository),
          },
        );
      },
    );
  }
}
