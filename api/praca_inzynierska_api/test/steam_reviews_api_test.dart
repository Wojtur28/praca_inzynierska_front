import 'package:test/test.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

/// tests for SteamReviewsApi
void main() {
  final instance = PracaInzynierskaApi().getSteamReviewsApi();

  group(SteamReviewsApi, () {
    // Retrieve paginated reviews for a specific game
    //
    //Future<BuiltList<SteamReview>> getGameReviews(String gameId, { int page, int size }) async
    test('test getGameReviews', () async {
      // TODO
    });
  });
}
