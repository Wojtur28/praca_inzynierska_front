import 'package:test/test.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

/// tests for GameRatingsApi
void main() {
  final instance = PracaInzynierskaApi().getGameRatingsApi();

  group(GameRatingsApi, () {
    // Create a new rating for a game
    //
    //Future<GameRating> createGameRating(String gameId, CreateGameRating createGameRating) async
    test('test createGameRating', () async {
      // TODO
    });

    // Retrieve paginated game ratings for a specific Steam game
    //
    //Future<BuiltList<GameRating>> getGameRatings(String gameId, { int page, int size }) async
    test('test getGameRatings', () async {
      // TODO
    });
  });
}
