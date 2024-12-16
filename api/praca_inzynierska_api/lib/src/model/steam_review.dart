//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'steam_review.g.dart';

/// SteamReview
///
/// Properties:
/// * [id] - Unique identifier of the review.
/// * [reviewId] - Unique Steam review ID.
/// * [userSteamId] - Steam ID of the user who wrote the review.
/// * [content] - Content of the review.
/// * [score] - Score given by the user in the review.
/// * [timestampCreated] - Timestamp when the review was created.
/// * [votesUp] - Number of upvotes for the review.
/// * [votesDown] - Number of downvotes for the review.
@BuiltValue()
abstract class SteamReview implements Built<SteamReview, SteamReviewBuilder> {
  /// Unique identifier of the review.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Unique Steam review ID.
  @BuiltValueField(wireName: r'reviewId')
  String? get reviewId;

  /// Steam ID of the user who wrote the review.
  @BuiltValueField(wireName: r'userSteamId')
  String? get userSteamId;

  /// Content of the review.
  @BuiltValueField(wireName: r'content')
  String? get content;

  /// Score given by the user in the review.
  @BuiltValueField(wireName: r'score')
  int? get score;

  /// Timestamp when the review was created.
  @BuiltValueField(wireName: r'timestampCreated')
  DateTime? get timestampCreated;

  /// Number of upvotes for the review.
  @BuiltValueField(wireName: r'votesUp')
  int? get votesUp;

  /// Number of downvotes for the review.
  @BuiltValueField(wireName: r'votesDown')
  int? get votesDown;

  SteamReview._();

  factory SteamReview([void updates(SteamReviewBuilder b)]) = _$SteamReview;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SteamReviewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SteamReview> get serializer => _$SteamReviewSerializer();
}

class _$SteamReviewSerializer implements PrimitiveSerializer<SteamReview> {
  @override
  final Iterable<Type> types = const [SteamReview, _$SteamReview];

  @override
  final String wireName = r'SteamReview';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SteamReview object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.reviewId != null) {
      yield r'reviewId';
      yield serializers.serialize(
        object.reviewId,
        specifiedType: const FullType(String),
      );
    }
    if (object.userSteamId != null) {
      yield r'userSteamId';
      yield serializers.serialize(
        object.userSteamId,
        specifiedType: const FullType(String),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(String),
      );
    }
    if (object.score != null) {
      yield r'score';
      yield serializers.serialize(
        object.score,
        specifiedType: const FullType(int),
      );
    }
    if (object.timestampCreated != null) {
      yield r'timestampCreated';
      yield serializers.serialize(
        object.timestampCreated,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.votesUp != null) {
      yield r'votesUp';
      yield serializers.serialize(
        object.votesUp,
        specifiedType: const FullType(int),
      );
    }
    if (object.votesDown != null) {
      yield r'votesDown';
      yield serializers.serialize(
        object.votesDown,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SteamReview object, {
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
    required SteamReviewBuilder result,
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
        case r'reviewId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reviewId = valueDes;
          break;
        case r'userSteamId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userSteamId = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.score = valueDes;
          break;
        case r'timestampCreated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.timestampCreated = valueDes;
          break;
        case r'votesUp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.votesUp = valueDes;
          break;
        case r'votesDown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.votesDown = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SteamReview deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SteamReviewBuilder();
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
