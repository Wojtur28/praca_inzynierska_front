//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_library.g.dart';

/// CreateLibrary
///
/// Properties:
/// * [dummy] - Empty payload
@BuiltValue()
abstract class CreateLibrary
    implements Built<CreateLibrary, CreateLibraryBuilder> {
  /// Empty payload
  @BuiltValueField(wireName: r'dummy')
  String? get dummy;

  CreateLibrary._();

  factory CreateLibrary([void updates(CreateLibraryBuilder b)]) =
      _$CreateLibrary;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateLibraryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateLibrary> get serializer =>
      _$CreateLibrarySerializer();
}

class _$CreateLibrarySerializer implements PrimitiveSerializer<CreateLibrary> {
  @override
  final Iterable<Type> types = const [CreateLibrary, _$CreateLibrary];

  @override
  final String wireName = r'CreateLibrary';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateLibrary object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.dummy != null) {
      yield r'dummy';
      yield serializers.serialize(
        object.dummy,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateLibrary object, {
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
    required CreateLibraryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'dummy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dummy = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateLibrary deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateLibraryBuilder();
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
