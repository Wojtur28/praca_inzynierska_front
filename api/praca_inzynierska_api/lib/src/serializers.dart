//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:praca_inzynierska_api/src/date_serializer.dart';
import 'package:praca_inzynierska_api/src/model/date.dart';

import 'package:praca_inzynierska_api/src/model/category.dart';
import 'package:praca_inzynierska_api/src/model/create_game_rating.dart';
import 'package:praca_inzynierska_api/src/model/create_game_rating_answer.dart';
import 'package:praca_inzynierska_api/src/model/game_rating.dart';
import 'package:praca_inzynierska_api/src/model/game_rating_answer.dart';
import 'package:praca_inzynierska_api/src/model/genre.dart';
import 'package:praca_inzynierska_api/src/model/platform.dart';
import 'package:praca_inzynierska_api/src/model/screenshot.dart';
import 'package:praca_inzynierska_api/src/model/steam_game.dart';
import 'package:praca_inzynierska_api/src/model/steam_game_detail.dart';
import 'package:praca_inzynierska_api/src/model/steam_game_with_details.dart';
import 'package:praca_inzynierska_api/src/model/steam_review.dart';
import 'package:praca_inzynierska_api/src/model/steam_user.dart';
import 'package:praca_inzynierska_api/src/model/user.dart';
import 'package:praca_inzynierska_api/src/model/vote.dart';
import 'package:praca_inzynierska_api/src/model/vote_count.dart';

part 'serializers.g.dart';

@SerializersFor([
  Category,
  CreateGameRating,
  CreateGameRatingAnswer,
  GameRating,
  GameRatingAnswer,
  Genre,
  Platform,
  Screenshot,
  SteamGame,
  $SteamGame,
  SteamGameDetail,
  SteamGameWithDetails,
  SteamReview,
  SteamUser,
  User,
  Vote,
  VoteCount,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(GameRating)]),
        () => ListBuilder<GameRating>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(User)]),
        () => ListBuilder<User>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SteamReview)]),
        () => ListBuilder<SteamReview>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(GameRatingAnswer)]),
        () => ListBuilder<GameRatingAnswer>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SteamGame)]),
        () => ListBuilder<SteamGame>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SteamGameWithDetails)]),
        () => ListBuilder<SteamGameWithDetails>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        () => ListBuilder<String>(),
      )
      ..add(SteamGame.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
