import 'package:test/test.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

// tests for SteamGame
void main() {
  final instance = SteamGameBuilder();
  // TODO add properties to the builder and call build()

  group(SteamGame, () {
    // Unique identifier of the Steam game.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Steam API identifier for the game.
    // int appId
    test('to test the property `appId`', () async {
      // TODO
    });

    // Title of the game.
    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // Total number of reviews for the game.
    // int reviewsTotal
    test('to test the property `reviewsTotal`', () async {
      // TODO
    });

    // Average review score in a fancy format (e.g., \"Very Positive\").
    // String reviewsScoreFancy
    test('to test the property `reviewsScoreFancy`', () async {
      // TODO
    });

    // Release date of the game.
    // Date releaseDate
    test('to test the property `releaseDate`', () async {
      // TODO
    });

    // Launch price of the game.
    // String launchPrice
    test('to test the property `launchPrice`', () async {
      // TODO
    });

    // Tags associated with the game, stored as a comma-separated string.
    // String tags
    test('to test the property `tags`', () async {
      // TODO
    });

    // URL to the game's Steam page.
    // String steamPage
    test('to test the property `steamPage`', () async {
      // TODO
    });
  });
}
