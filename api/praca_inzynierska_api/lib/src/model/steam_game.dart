//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:praca_inzynierska_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'steam_game.g.dart';

/// SteamGame
///
/// Properties:
/// * [id] - Unique identifier of the Steam game.
/// * [appId] - Steam API identifier for the game.
/// * [title] - Title of the game.
/// * [reviewsTotal] - Total number of reviews for the game.
/// * [reviewsScoreFancy] - Average review score in a fancy format (e.g., \"Very Positive\").
/// * [releaseDate] - Release date of the game.
/// * [launchPrice] - Launch price of the game.
/// * [tags] - Tags associated with the game, stored as a comma-separated string.
/// * [steamPage] - URL to the game's Steam page.
@BuiltValue()
abstract class SteamGame implements Built<SteamGame, SteamGameBuilder> {
  /// Unique identifier of the Steam game.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Steam API identifier for the game.
  @BuiltValueField(wireName: r'appId')
  int? get appId;

  /// Title of the game.
  @BuiltValueField(wireName: r'title')
  String? get title;

  /// Total number of reviews for the game.
  @BuiltValueField(wireName: r'reviewsTotal')
  int? get reviewsTotal;

  /// Average review score in a fancy format (e.g., \"Very Positive\").
  @BuiltValueField(wireName: r'reviewsScoreFancy')
  String? get reviewsScoreFancy;

  /// Release date of the game.
  @BuiltValueField(wireName: r'releaseDate')
  Date? get releaseDate;

  /// Launch price of the game.
  @BuiltValueField(wireName: r'launchPrice')
  String? get launchPrice;

  /// Tags associated with the game, stored as a comma-separated string.
  @BuiltValueField(wireName: r'tags')
  String? get tags;

  /// URL to the game's Steam page.
  @BuiltValueField(wireName: r'steamPage')
  String? get steamPage;

  SteamGame._();

  factory SteamGame([void updates(SteamGameBuilder b)]) = _$SteamGame;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SteamGameBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SteamGame> get serializer => _$SteamGameSerializer();
}

class _$SteamGameSerializer implements PrimitiveSerializer<SteamGame> {
  @override
  final Iterable<Type> types = const [SteamGame, _$SteamGame];

  @override
  final String wireName = r'SteamGame';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SteamGame object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.appId != null) {
      yield r'appId';
      yield serializers.serialize(
        object.appId,
        specifiedType: const FullType(int),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.reviewsTotal != null) {
      yield r'reviewsTotal';
      yield serializers.serialize(
        object.reviewsTotal,
        specifiedType: const FullType(int),
      );
    }
    if (object.reviewsScoreFancy != null) {
      yield r'reviewsScoreFancy';
      yield serializers.serialize(
        object.reviewsScoreFancy,
        specifiedType: const FullType(String),
      );
    }
    if (object.releaseDate != null) {
      yield r'releaseDate';
      yield serializers.serialize(
        object.releaseDate,
        specifiedType: const FullType(Date),
      );
    }
    if (object.launchPrice != null) {
      yield r'launchPrice';
      yield serializers.serialize(
        object.launchPrice,
        specifiedType: const FullType(String),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(String),
      );
    }
    if (object.steamPage != null) {
      yield r'steamPage';
      yield serializers.serialize(
        object.steamPage,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SteamGame object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SteamGameBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'appId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.appId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'reviewsTotal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.reviewsTotal = valueDes;
          break;
        case r'reviewsScoreFancy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reviewsScoreFancy = valueDes;
          break;
        case r'releaseDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.releaseDate = valueDes;
          break;
        case r'launchPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.launchPrice = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tags = valueDes;
          break;
        case r'steamPage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.steamPage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SteamGame deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SteamGameBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
