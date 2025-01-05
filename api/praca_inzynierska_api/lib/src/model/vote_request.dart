//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vote_request.g.dart';

/// VoteRequest
///
/// Properties:
/// * [voteType] - Type of vote (up or down).
@BuiltValue()
abstract class VoteRequest implements Built<VoteRequest, VoteRequestBuilder> {
  /// Type of vote (up or down).
  @BuiltValueField(wireName: r'voteType')
  VoteRequestVoteTypeEnum? get voteType;
  // enum voteTypeEnum {  UP,  DOWN,  };

  VoteRequest._();

  factory VoteRequest([void updates(VoteRequestBuilder b)]) = _$VoteRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoteRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoteRequest> get serializer => _$VoteRequestSerializer();
}

class _$VoteRequestSerializer implements PrimitiveSerializer<VoteRequest> {
  @override
  final Iterable<Type> types = const [VoteRequest, _$VoteRequest];

  @override
  final String wireName = r'VoteRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoteRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.voteType != null) {
      yield r'voteType';
      yield serializers.serialize(
        object.voteType,
        specifiedType: const FullType(VoteRequestVoteTypeEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoteRequest object, {
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
    required VoteRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'voteType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoteRequestVoteTypeEnum),
          ) as VoteRequestVoteTypeEnum;
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
  VoteRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoteRequestBuilder();
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

class VoteRequestVoteTypeEnum extends EnumClass {
  /// Type of vote (up or down).
  @BuiltValueEnumConst(wireName: r'UP')
  static const VoteRequestVoteTypeEnum UP = _$voteRequestVoteTypeEnum_UP;

  /// Type of vote (up or down).
  @BuiltValueEnumConst(wireName: r'DOWN')
  static const VoteRequestVoteTypeEnum DOWN = _$voteRequestVoteTypeEnum_DOWN;

  static Serializer<VoteRequestVoteTypeEnum> get serializer =>
      _$voteRequestVoteTypeEnumSerializer;

  const VoteRequestVoteTypeEnum._(String name) : super(name);

  static BuiltSet<VoteRequestVoteTypeEnum> get values =>
      _$voteRequestVoteTypeEnumValues;
  static VoteRequestVoteTypeEnum valueOf(String name) =>
      _$voteRequestVoteTypeEnumValueOf(name);
}
