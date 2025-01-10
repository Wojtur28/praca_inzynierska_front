//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vote_count.g.dart';

/// VoteCount
///
/// Properties:
/// * [downvotes] - Number of downvotes
/// * [upvotes] - Number of upvotes.
@BuiltValue()
abstract class VoteCount implements Built<VoteCount, VoteCountBuilder> {
  /// Number of downvotes
  @BuiltValueField(wireName: r'downvotes')
  int? get downvotes;

  /// Number of upvotes.
  @BuiltValueField(wireName: r'upvotes')
  int? get upvotes;

  VoteCount._();

  factory VoteCount([void updates(VoteCountBuilder b)]) = _$VoteCount;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoteCountBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoteCount> get serializer => _$VoteCountSerializer();
}

class _$VoteCountSerializer implements PrimitiveSerializer<VoteCount> {
  @override
  final Iterable<Type> types = const [VoteCount, _$VoteCount];

  @override
  final String wireName = r'VoteCount';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoteCount object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.downvotes != null) {
      yield r'downvotes';
      yield serializers.serialize(
        object.downvotes,
        specifiedType: const FullType(int),
      );
    }
    if (object.upvotes != null) {
      yield r'upvotes';
      yield serializers.serialize(
        object.upvotes,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoteCount object, {
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
    required VoteCountBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'downvotes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.downvotes = valueDes;
          break;
        case r'upvotes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.upvotes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoteCount deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoteCountBuilder();
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
