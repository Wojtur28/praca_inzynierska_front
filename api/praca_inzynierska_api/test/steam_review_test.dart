import 'package:test/test.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

// tests for SteamReview
void main() {
  final instance = SteamReviewBuilder();
  // TODO add properties to the builder and call build()

  group(SteamReview, () {
    // Unique identifier of the review.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Unique Steam review ID.
    // String reviewId
    test('to test the property `reviewId`', () async {
      // TODO
    });

    // Steam ID of the user who wrote the review.
    // String userSteamId
    test('to test the property `userSteamId`', () async {
      // TODO
    });

    // Content of the review.
    // String content
    test('to test the property `content`', () async {
      // TODO
    });

    // Score given by the user in the review.
    // int score
    test('to test the property `score`', () async {
      // TODO
    });

    // Timestamp when the review was created.
    // DateTime timestampCreated
    test('to test the property `timestampCreated`', () async {
      // TODO
    });

    // Number of upvotes for the review.
    // int votesUp
    test('to test the property `votesUp`', () async {
      // TODO
    });

    // Number of downvotes for the review.
    // int votesDown
    test('to test the property `votesDown`', () async {
      // TODO
    });
  });
}
