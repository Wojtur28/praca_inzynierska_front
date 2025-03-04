// Openapi Generator last run: : 2025-02-16T17:14:35.971992
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
import 'package:praca_inzynierska_front/presentation/pages/admin_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/game_details_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/game_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/library_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/profile_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/recommend_game_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/sign_in_page.dart';
import 'package:praca_inzynierska_front/presentation/pages/sign_up_page.dart';
import 'package:praca_inzynierska_front/presentation/widgets/main_scaffold.dart';

import 'auth/CustomAuthInterceptor.dart';
import 'data/auth_storage.dart';
import 'domain/repositories/auth_repository.dart';
import 'presentation/pages/report_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final ValueNotifier<bool> isAdminNotifier = ValueNotifier<bool>(false);
final ValueNotifier<bool> isLoggedInNotifier = ValueNotifier<bool>(false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authStorage = AuthStorage();
  final token = await authStorage.getToken();
  final bool isLoggedIn = token != null && token.isNotEmpty;
  isLoggedInNotifier.value = isLoggedIn;
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));
  final bearerAuthInterceptor = BearerAuthInterceptor();
  dio.interceptors.add(CustomAuthInterceptor(authStorage: authStorage));
  dio.interceptors.add(bearerAuthInterceptor);
  if (isLoggedIn) {
    bearerAuthInterceptor.tokens['bearerAuth'] = token;
  }
  final authRepository = AuthRepository(dio);
  final userApi = UserApi(dio, standardSerializers);
  final libraryApi = LibraryApi(dio, standardSerializers);
  runApp(MyApp(
    initialRoute: isLoggedIn ? '/recommendations' : '/signin',
    dio: dio,
    navigatorKey: navigatorKey,
    authRepository: authRepository,
    userApi: userApi,
    libraryApi: libraryApi,
    isLoggedIn: isLoggedIn,
  ));
}

@Openapi(
  additionalProperties: DioProperties(
    pubName: 'praca_inzynierska_api',
    pubAuthor: 'Maciej Wojturski',
  ),
  inputSpec: InputSpec(path: 'lib/contract/contract.yml'),
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'api/praca_inzynierska_api',
)
class MyApp extends StatefulWidget {
  final String initialRoute;
  final Dio dio;
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthRepository authRepository;
  final UserApi userApi;
  final LibraryApi libraryApi;
  final bool isLoggedIn;

  const MyApp({
    Key? key,
    required this.initialRoute,
    required this.dio,
    required this.navigatorKey,
    required this.authRepository,
    required this.userApi,
    required this.libraryApi,
    required this.isLoggedIn,
  }) : super(key: key);

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
          navigatorKey: widget.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Praca inżynierska',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          initialRoute: widget.initialRoute,
          routes: {
            '/signin': (context) =>
                SignInPage(dio: widget.dio, themeNotifier: _themeNotifier),
            '/signup': (context) =>
                SignUpPage(dio: widget.dio, themeNotifier: _themeNotifier),
            '/recommendations': (context) => ValueListenableBuilder<bool>(
              valueListenable: isAdminNotifier,
              builder: (context, isAdmin, child) {
                return MainScaffold(
                  isAdmin: isAdmin,
                  isLoggedIn: isLoggedInNotifier.value,
                  currentTheme: _themeNotifier.value,
                  onThemeChange: (newTheme) =>
                  _themeNotifier.value = newTheme,
                  onLogout: () async {
                    await widget.authRepository.logout();
                    isAdminNotifier.value = false;
                    isLoggedInNotifier.value = false;
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  appBarTitle: 'Rekomendacje',
                  body: RecommendedGamesPage(
                    dio: widget.dio,
                    themeNotifier: _themeNotifier,
                    authRepository: widget.authRepository,
                  ),
                );
              },
            ),
            '/games': (context) => ValueListenableBuilder<bool>(
              valueListenable: isAdminNotifier,
              builder: (context, isAdmin, child) {
                return MainScaffold(
                  isAdmin: isAdmin,
                  isLoggedIn: isLoggedInNotifier.value,
                  currentTheme: _themeNotifier.value,
                  onThemeChange: (newTheme) =>
                  _themeNotifier.value = newTheme,
                  onLogout: () async {
                    await widget.authRepository.logout();
                    isAdminNotifier.value = false;
                    isLoggedInNotifier.value = false;
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  appBarTitle: 'Gry',
                  body: GamesPage(
                    dio: widget.dio,
                    themeNotifier: _themeNotifier,
                    authRepository: widget.authRepository,
                  ),
                );
              },
            ),
            '/admin': (context) => ValueListenableBuilder<bool>(
              valueListenable: isAdminNotifier,
              builder: (context, isAdmin, child) {
                return MainScaffold(
                  isAdmin: isAdmin,
                  isLoggedIn: isLoggedInNotifier.value,
                  currentTheme: _themeNotifier.value,
                  onThemeChange: (newTheme) =>
                  _themeNotifier.value = newTheme,
                  onLogout: () async {
                    await widget.authRepository.logout();
                    isAdminNotifier.value = false;
                    isLoggedInNotifier.value = false;
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  appBarTitle: 'Admin',
                  body: AdminPanelPage(
                    dio: widget.dio,
                    userApi: widget.userApi,
                  ),
                );
              },
            ),
            '/profile': (context) => ValueListenableBuilder<bool>(
              valueListenable: isAdminNotifier,
              builder: (context, isAdmin, child) {
                return MainScaffold(
                  isAdmin: isAdmin,
                  isLoggedIn: isLoggedInNotifier.value,
                  currentTheme: _themeNotifier.value,
                  onThemeChange: (newTheme) =>
                  _themeNotifier.value = newTheme,
                  onLogout: () async {
                    await widget.authRepository.logout();
                    isAdminNotifier.value = false;
                    isLoggedInNotifier.value = false;
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  appBarTitle: 'Profil',
                  body: ProfilePage(
                    dio: widget.dio,
                    userApi: widget.userApi,
                    libraryApi: widget.libraryApi,
                  ),
                );
              },
            ),
            '/reports': (context) => ValueListenableBuilder<bool>(
              valueListenable: isAdminNotifier,
              builder: (context, isAdmin, child) {
                return MainScaffold(
                  isAdmin: isAdmin,
                  isLoggedIn: isLoggedInNotifier.value,
                  currentTheme: _themeNotifier.value,
                  onThemeChange: (newTheme) =>
                  _themeNotifier.value = newTheme,
                  onLogout: () async {
                    await widget.authRepository.logout();
                    isAdminNotifier.value = false;
                    isLoggedInNotifier.value = false;
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  appBarTitle: 'Raporty',
                  body: ReportsPage(
                    dio: widget.dio,
                    reportApi: ReportApi(widget.dio, standardSerializers),
                  ),
                );
              },
            ),
            '/library': (context) => ValueListenableBuilder<bool>(
              valueListenable: isAdminNotifier,
              builder: (context, isAdmin, child) {
                return MainScaffold(
                  isAdmin: isAdmin,
                  isLoggedIn: isLoggedInNotifier.value,
                  currentTheme: _themeNotifier.value,
                  onThemeChange: (newTheme) =>
                  _themeNotifier.value = newTheme,
                  onLogout: () async {
                    await widget.authRepository.logout();
                    isAdminNotifier.value = false;
                    isLoggedInNotifier.value = false;
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  appBarTitle: 'Biblioteka',
                  body: LibraryPage(dio: widget.dio),
                );
              },
            ),
          },
          onGenerateRoute: (settings) {
            if (settings.name != null && settings.name!.startsWith('/game_details/')) {
              final uri = Uri.parse(settings.name!);
              if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'game_details') {
                final gameId = uri.pathSegments[1];
                return MaterialPageRoute(
                  builder: (context) => GameDetailsPage(
                    dio: widget.dio,
                    gameId: gameId,
                    onLogout: () async {
                      await widget.authRepository.logout();
                      isAdminNotifier.value = false;
                      isLoggedInNotifier.value = false;
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
                    onThemeChange: (newTheme) {
                      _themeNotifier.value = newTheme;
                    },
                    currentTheme: _themeNotifier.value,
                    isLoggedIn: isLoggedInNotifier.value,
                  ),
                );
              }
            }
            return null;
          },
        );
      },
    );
  }
}
