import 'package:test/test.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

/// tests for SteamGamesApi
void main() {
  final instance = PracaInzynierskaApi().getSteamGamesApi();

  group(SteamGamesApi, () {
    // Retrieve Steam game details for a specific game
    //
    //Future<SteamGameDetail> getSteamGameDetail(String gameId) async
    test('test getSteamGameDetail', () async {
      // TODO
    });

    // Retrieve paginated list of Steam games
    //
    //Future<BuiltList<SteamGame>> getSteamGames({ int page, int size }) async
    test('test getSteamGames', () async {
      // TODO
    });
  });
}
