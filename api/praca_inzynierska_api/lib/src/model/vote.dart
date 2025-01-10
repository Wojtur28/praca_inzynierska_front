//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vote.g.dart';

/// Vote
///
/// Properties:
/// * [voteType] - Type of the vote (upvote or downvote).
@BuiltValue()
abstract class Vote implements Built<Vote, VoteBuilder> {
  /// Type of the vote (upvote or downvote).
  @BuiltValueField(wireName: r'voteType')
  String? get voteType;

  Vote._();

  factory Vote([void updates(VoteBuilder b)]) = _$Vote;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Vote> get serializer => _$VoteSerializer();
}

class _$VoteSerializer implements PrimitiveSerializer<Vote> {
  @override
  final Iterable<Type> types = const [Vote, _$Vote];

  @override
  final String wireName = r'Vote';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Vote object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.voteType != null) {
      yield r'voteType';
      yield serializers.serialize(
        object.voteType,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Vote object, {
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
    required VoteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'voteType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.voteType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Vote deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoteBuilder();
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
