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
import 'package:praca_inzynierska_api/src/model/game_rating.dart';
import 'package:praca_inzynierska_api/src/model/genre.dart';
import 'package:praca_inzynierska_api/src/model/platform.dart';
import 'package:praca_inzynierska_api/src/model/steam_game.dart';
import 'package:praca_inzynierska_api/src/model/steam_game_detail.dart';
import 'package:praca_inzynierska_api/src/model/steam_review.dart';
import 'package:praca_inzynierska_api/src/model/steam_user.dart';
import 'package:praca_inzynierska_api/src/model/user.dart';

part 'serializers.g.dart';

@SerializersFor([
  Category,
  CreateGameRating,
  GameRating,
  Genre,
  Platform,
  SteamGame,
  SteamGameDetail,
  SteamReview,
  SteamUser,
  User,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(GameRating)]),
        () => ListBuilder<GameRating>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SteamReview)]),
        () => ListBuilder<SteamReview>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SteamGame)]),
        () => ListBuilder<SteamGame>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
