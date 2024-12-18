import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

class GamesRepository {
  final SteamGamesApi _steamGamesApi;

  GamesRepository(Dio dio) : _steamGamesApi = SteamGamesApi(dio, standardSerializers);

  Future<List<SteamGameWithDetails>> fetchGamesWithDetails({
    int page = 0,
    int size = 10,
    String? platform,
    List<String>? categories,
    List<String>? genres,
    String? search,
  }) async {
    try {
      final response = await _steamGamesApi.getSteamGamesWithDetails(
        page: page,
        size: size,
        platform: platform,
        categories: categories != null ? BuiltList<String>(categories) : null,
        genres: genres != null ? BuiltList<String>(genres) : null,
        search: search,
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data!.toList();
      } else {
        throw Exception('Failed to load games with details');
      }
    } catch (e) {
      throw Exception('Error fetching games with details: $e');
    }
  }

}
