
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:praca_inzynierska_front/data/auth_storage.dart';

import '../main.dart';

class CustomAuthInterceptor extends Interceptor {
  final AuthStorage authStorage;

  CustomAuthInterceptor({required this.authStorage});

  bool _isAuthEndpoint(String path) {
    const authEndpoints = [
      '/auth/signin',
      '/auth/signup',
    ];

    return authEndpoints.any((endpoint) => path.contains(endpoint));
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isAuthEndpoint(err.requestOptions.path)) {
      await authStorage.clearToken();

      if (navigatorKey.currentState?.context != null) {
        ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
          const SnackBar(
            content: Text(
              'Twoja sesja wygasła. Zaloguj się ponownie.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }

      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/signin',
            (route) => false,
      );
    } else {
      handler.next(err);
    }
  }
}
