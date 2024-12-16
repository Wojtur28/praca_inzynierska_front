import 'package:test/test.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

// tests for SteamUser
void main() {
  final instance = SteamUserBuilder();
  // TODO add properties to the builder and call build()

  group(SteamUser, () {
    // Unique identifier of the Steam user.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Unique Steam ID of the user.
    // String steamId
    test('to test the property `steamId`', () async {
      // TODO
    });

    // List of reviews written by the user.
    // BuiltList<SteamReview> steamReviews
    test('to test the property `steamReviews`', () async {
      // TODO
    });
  });
}
