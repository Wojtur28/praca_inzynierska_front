//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_game_rating_answer.g.dart';

/// CreateGameRatingAnswer
///
/// Properties:
/// * [content] - Content of the answer.
@BuiltValue()
abstract class CreateGameRatingAnswer
    implements Built<CreateGameRatingAnswer, CreateGameRatingAnswerBuilder> {
  /// Content of the answer.
  @BuiltValueField(wireName: r'content')
  String? get content;

  CreateGameRatingAnswer._();

  factory CreateGameRatingAnswer(
          [void updates(CreateGameRatingAnswerBuilder b)]) =
      _$CreateGameRatingAnswer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateGameRatingAnswerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateGameRatingAnswer> get serializer =>
      _$CreateGameRatingAnswerSerializer();
}

class _$CreateGameRatingAnswerSerializer
    implements PrimitiveSerializer<CreateGameRatingAnswer> {
  @override
  final Iterable<Type> types = const [
    CreateGameRatingAnswer,
    _$CreateGameRatingAnswer
  ];

  @override
  final String wireName = r'CreateGameRatingAnswer';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateGameRatingAnswer object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    CreateGameRatingAnswer object, {
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
    required CreateGameRatingAnswerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  CreateGameRatingAnswer deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateGameRatingAnswerBuilder();
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
