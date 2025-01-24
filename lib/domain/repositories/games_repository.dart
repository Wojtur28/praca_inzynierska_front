import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

import '../../data/filter_options.dart';

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
        categories: categories != null ? BuiltList<String>.from(categories) : null,
        genres: genres != null ? BuiltList<String>.from(genres) : null,
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

  Future<List<String>> fetchAllCategories() async {
    await Future.delayed(Duration(milliseconds: 100));
    return allCategories;
  }

  Future<List<String>> fetchAllGenres() async {
    await Future.delayed(Duration(milliseconds: 100));
    return allGenres;
  }

  Future<List<String>> fetchAllPlatforms() async {
    await Future.delayed(Duration(milliseconds: 100));
    return platforms;
  }
}
