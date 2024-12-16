//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'platform.g.dart';

/// Platform
///
/// Properties:
/// * [id] - Unique identifier of the platform.
/// * [name] - Name of the platform.
/// * [isSupport] - Indicates if the platform is supported.
@BuiltValue()
abstract class Platform implements Built<Platform, PlatformBuilder> {
  /// Unique identifier of the platform.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Name of the platform.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Indicates if the platform is supported.
  @BuiltValueField(wireName: r'isSupport')
  bool? get isSupport;

  Platform._();

  factory Platform([void updates(PlatformBuilder b)]) = _$Platform;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PlatformBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Platform> get serializer => _$PlatformSerializer();
}

class _$PlatformSerializer implements PrimitiveSerializer<Platform> {
  @override
  final Iterable<Type> types = const [Platform, _$Platform];

  @override
  final String wireName = r'Platform';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Platform object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.isSupport != null) {
      yield r'isSupport';
      yield serializers.serialize(
        object.isSupport,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Platform object, {
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
    required PlatformBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'isSupport':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isSupport = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Platform deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PlatformBuilder();
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
