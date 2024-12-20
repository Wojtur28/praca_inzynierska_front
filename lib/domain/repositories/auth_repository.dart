import 'package:dio/dio.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

import '../models/sign_in_user.dart';
import '../models/sign_up_user.dart';
import '../../data/auth_storage.dart';

class AuthRepository {
  final Dio _dio;
  final AuthStorage _authStorage;

  AuthRepository(this._dio): _authStorage = AuthStorage();

  Future<bool> signIn(SignInUser user) async {
    final response = await _dio.post('/auth/signin', data: {
      'email': user.email,
      'password': user.password,
    });

    if (response.statusCode == 200 && response.data != null) {
      final token = response.data['token'];
      if (token != null) {
        await _authStorage.saveToken(token);
        final bearerAuthInterceptor = _dio.interceptors.firstWhere(
              (i) => i is BearerAuthInterceptor,
          orElse: () => throw StateError('BearerAuthInterceptor not found'),
        ) as BearerAuthInterceptor;
        bearerAuthInterceptor.tokens['bearerAuth'] = token;
        return true;
      }
    }
    return false;
  }

  Future<bool> signUp(SignUpUser user) async {
    String genderStr;
    switch (user.gender) {
      case Gender.male:
        genderStr = 'MALE';
        break;
      case Gender.female:
        genderStr = 'FEMALE';
        break;
      default:
        genderStr = 'OTHER';
        break;
    }

    final dob = user.dateOfBirth.toIso8601String().split('T')[0];

    final response = await _dio.post('/auth/signup', data: {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'password': user.password,
      'gender': genderStr,
      'dateOfBirth': dob,
    });

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<void> logout() async {
    await _authStorage.clearToken();
    final bearerAuthInterceptor = _dio.interceptors.firstWhere(
          (i) => i is BearerAuthInterceptor,
      orElse: () => throw StateError('BearerAuthInterceptor not found'),
    ) as BearerAuthInterceptor;
    bearerAuthInterceptor.tokens.remove('bearerAuth');
  }
}
