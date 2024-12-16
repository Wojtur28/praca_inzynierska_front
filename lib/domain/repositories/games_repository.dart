import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

class GamesRepository {
  final SteamGamesApi _steamGamesApi;

  GamesRepository(Dio dio) : _steamGamesApi = SteamGamesApi(dio, standardSerializers);

  Future<BuiltList<SteamGameWithDetails>> fetchGamesWithDetails({int page = 0, int size = 10, String? platform}) async {
    final response = await _steamGamesApi.getSteamGamesWithDetails(page: page, size: size, platform: platform);
    if (response.statusCode == 200 && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load games with details');
    }
  }
}
