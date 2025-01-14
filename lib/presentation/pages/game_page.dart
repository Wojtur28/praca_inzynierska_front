import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:praca_inzynierska_front/domain/repositories/auth_repository.dart';

import '../widgets/game_page_content.dart';

class GamesPage extends StatelessWidget {
  final Dio dio;
  final ValueNotifier<ThemeMode> themeNotifier;
  final AuthRepository authRepository;

  const GamesPage({
    super.key,
    required this.dio,
    required this.themeNotifier,
    required this.authRepository,
  });

  @override
  Widget build(BuildContext context) {
    return GamesPageContent(
      dio: dio,
      themeNotifier: themeNotifier,
      authRepository: authRepository,
    );
  }
}
