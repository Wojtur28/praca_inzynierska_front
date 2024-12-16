//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_game_rating.g.dart';

/// CreateGameRating
///
/// Properties:
/// * [steamGameId] - The ID of the Steam game to rate.
/// * [userId] - The ID of the user creating the rating.
/// * [rating] - Rating score (1-10).
/// * [content] - User's review content.
@BuiltValue()
abstract class CreateGameRating
    implements Built<CreateGameRating, CreateGameRatingBuilder> {
  /// The ID of the Steam game to rate.
  @BuiltValueField(wireName: r'steamGameId')
  String? get steamGameId;

  /// The ID of the user creating the rating.
  @BuiltValueField(wireName: r'userId')
  String? get userId;

  /// Rating score (1-10).
  @BuiltValueField(wireName: r'rating')
  int? get rating;

  /// User's review content.
  @BuiltValueField(wireName: r'content')
  String? get content;

  CreateGameRating._();

  factory CreateGameRating([void updates(CreateGameRatingBuilder b)]) =
      _$CreateGameRating;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateGameRatingBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateGameRating> get serializer =>
      _$CreateGameRatingSerializer();
}

class _$CreateGameRatingSerializer
    implements PrimitiveSerializer<CreateGameRating> {
  @override
  final Iterable<Type> types = const [CreateGameRating, _$CreateGameRating];

  @override
  final String wireName = r'CreateGameRating';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateGameRating object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.steamGameId != null) {
      yield r'steamGameId';
      yield serializers.serialize(
        object.steamGameId,
        specifiedType: const FullType(String),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateGameRating object, {
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
    required CreateGameRatingBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'steamGameId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.steamGameId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateGameRating deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateGameRatingBuilder();
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
