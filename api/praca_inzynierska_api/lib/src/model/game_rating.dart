//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:praca_inzynierska_api/src/model/steam_game.dart';
import 'package:praca_inzynierska_api/src/model/user.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'game_rating.g.dart';

/// GameRating
///
/// Properties:
/// * [id] - Unique identifier of the rating.
/// * [steamGame]
/// * [user]
/// * [rating] - The rating score given by the user.
/// * [content] - Additional comments provided by the user.
/// * [createdAt] - Timestamp when the rating was created.
@BuiltValue()
abstract class GameRating implements Built<GameRating, GameRatingBuilder> {
  /// Unique identifier of the rating.
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'steamGame')
  SteamGame? get steamGame;

  @BuiltValueField(wireName: r'user')
  User? get user;

  /// The rating score given by the user.
  @BuiltValueField(wireName: r'rating')
  int? get rating;

  /// Additional comments provided by the user.
  @BuiltValueField(wireName: r'content')
  String? get content;

  /// Timestamp when the rating was created.
  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  GameRating._();

  factory GameRating([void updates(GameRatingBuilder b)]) = _$GameRating;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GameRatingBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GameRating> get serializer => _$GameRatingSerializer();
}

class _$GameRatingSerializer implements PrimitiveSerializer<GameRating> {
  @override
  final Iterable<Type> types = const [GameRating, _$GameRating];

  @override
  final String wireName = r'GameRating';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GameRating object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.steamGame != null) {
      yield r'steamGame';
      yield serializers.serialize(
        object.steamGame,
        specifiedType: const FullType(SteamGame),
      );
    }
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType(User),
      );
    }
    if (object.rating != null) {
      yield r'rating';
      yield serializers.serialize(
        object.rating,
        specifiedType: const FullType(int),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GameRating object, {
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
    required GameRatingBuilder result,
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
        case r'steamGame':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SteamGame),
          ) as SteamGame;
          result.steamGame = valueDes;
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(User),
          ) as User;
          result.user.replace(valueDes);
          break;
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rating = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GameRating deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GameRatingBuilder();
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
