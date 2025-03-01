//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:praca_inzynierska_api/src/serializers.dart';
import 'package:praca_inzynierska_api/src/auth/api_key_auth.dart';
import 'package:praca_inzynierska_api/src/auth/basic_auth.dart';
import 'package:praca_inzynierska_api/src/auth/bearer_auth.dart';
import 'package:praca_inzynierska_api/src/auth/oauth.dart';
import 'package:praca_inzynierska_api/src/api/game_rating_answers_api.dart';
import 'package:praca_inzynierska_api/src/api/game_ratings_api.dart';
import 'package:praca_inzynierska_api/src/api/game_views_api.dart';
import 'package:praca_inzynierska_api/src/api/library_api.dart';
import 'package:praca_inzynierska_api/src/api/recommended_games_api.dart';
import 'package:praca_inzynierska_api/src/api/report_api.dart';
import 'package:praca_inzynierska_api/src/api/steam_games_api.dart';
import 'package:praca_inzynierska_api/src/api/steam_reviews_api.dart';
import 'package:praca_inzynierska_api/src/api/user_api.dart';
import 'package:praca_inzynierska_api/src/api/votes_api.dart';

class PracaInzynierskaApi {
  static const String basePath = r'http://localhost:8080';

  final Dio dio;
  final Serializers serializers;

  PracaInzynierskaApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get GameRatingAnswersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GameRatingAnswersApi getGameRatingAnswersApi() {
    return GameRatingAnswersApi(dio, serializers);
  }

  /// Get GameRatingsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GameRatingsApi getGameRatingsApi() {
    return GameRatingsApi(dio, serializers);
  }

  /// Get GameViewsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GameViewsApi getGameViewsApi() {
    return GameViewsApi(dio, serializers);
  }

  /// Get LibraryApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  LibraryApi getLibraryApi() {
    return LibraryApi(dio, serializers);
  }

  /// Get RecommendedGamesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RecommendedGamesApi getRecommendedGamesApi() {
    return RecommendedGamesApi(dio, serializers);
  }

  /// Get ReportApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReportApi getReportApi() {
    return ReportApi(dio, serializers);
  }

  /// Get SteamGamesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SteamGamesApi getSteamGamesApi() {
    return SteamGamesApi(dio, serializers);
  }

  /// Get SteamReviewsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SteamReviewsApi getSteamReviewsApi() {
    return SteamReviewsApi(dio, serializers);
  }

  /// Get UserApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserApi getUserApi() {
    return UserApi(dio, serializers);
  }

  /// Get VotesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  VotesApi getVotesApi() {
    return VotesApi(dio, serializers);
  }
}
