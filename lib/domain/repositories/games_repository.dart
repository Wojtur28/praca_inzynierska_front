// import 'package:built_collection/built_collection.dart';
// import 'package:dio/dio.dart';
// import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
//
// class GamesRepository {
//   final SteamGamesApi _steamGamesApi;
//
//   GamesRepository({String baseUrl = 'http://localhost:8080'})
//       : _steamGamesApi = SteamGamesApi(
//     Dio(BaseOptions(baseUrl: baseUrl)),
//     serializers, // <-- Dodaj ten argument
//   );
//
//   Future<Response<BuiltList<SteamGame>>> fetchGames({int page = 0, int size = 10}) async {
//     return await _steamGamesApi.getSteamGames(page: page, size: size);
//   }
// }
