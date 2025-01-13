//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:praca_inzynierska_api/src/model/game_rating.dart';
import 'package:praca_inzynierska_api/src/model/user.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'game_rating_answer.g.dart';

/// GameRatingAnswer
///
/// Properties:
/// * [id] - Unique identifier of the answer.
/// * [gameRating]
/// * [user]
/// * [content] - Content of the answer.
/// * [createdAt] - Timestamp when the answer was created.
/// * [createdBy] - User who created the answer.
@BuiltValue()
abstract class GameRatingAnswer
    implements Built<GameRatingAnswer, GameRatingAnswerBuilder> {
  /// Unique identifier of the answer.
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'gameRating')
  GameRating? get gameRating;

  @BuiltValueField(wireName: r'user')
  User? get user;

  /// Content of the answer.
  @BuiltValueField(wireName: r'content')
  String? get content;

  /// Timestamp when the answer was created.
  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  /// User who created the answer.
  @BuiltValueField(wireName: r'createdBy')
  String? get createdBy;

  GameRatingAnswer._();

  factory GameRatingAnswer([void updates(GameRatingAnswerBuilder b)]) =
      _$GameRatingAnswer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GameRatingAnswerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GameRatingAnswer> get serializer =>
      _$GameRatingAnswerSerializer();
}

class _$GameRatingAnswerSerializer
    implements PrimitiveSerializer<GameRatingAnswer> {
  @override
  final Iterable<Type> types = const [GameRatingAnswer, _$GameRatingAnswer];

  @override
  final String wireName = r'GameRatingAnswer';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GameRatingAnswer object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.gameRating != null) {
      yield r'gameRating';
      yield serializers.serialize(
        object.gameRating,
        specifiedType: const FullType(GameRating),
      );
    }
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType(User),
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
    if (object.createdBy != null) {
      yield r'createdBy';
      yield serializers.serialize(
        object.createdBy,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GameRatingAnswer object, {
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
    required GameRatingAnswerBuilder result,
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
        case r'gameRating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GameRating),
          ) as GameRating;
          result.gameRating.replace(valueDes);
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(User),
          ) as User;
          result.user.replace(valueDes);
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
        case r'createdBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdBy = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GameRatingAnswer deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GameRatingAnswerBuilder();
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
