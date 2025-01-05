//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenshot.g.dart';

/// Screenshot
///
/// Properties:
/// * [id] - Unique identifier of the screenshot.
/// * [pathThumbnail] - URL to the thumbnail version of the screenshot.
/// * [pathFull] - URL to the full-size version of the screenshot.
@BuiltValue()
abstract class Screenshot implements Built<Screenshot, ScreenshotBuilder> {
  /// Unique identifier of the screenshot.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// URL to the thumbnail version of the screenshot.
  @BuiltValueField(wireName: r'pathThumbnail')
  String? get pathThumbnail;

  /// URL to the full-size version of the screenshot.
  @BuiltValueField(wireName: r'pathFull')
  String? get pathFull;

  Screenshot._();

  factory Screenshot([void updates(ScreenshotBuilder b)]) = _$Screenshot;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenshotBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Screenshot> get serializer => _$ScreenshotSerializer();
}

class _$ScreenshotSerializer implements PrimitiveSerializer<Screenshot> {
  @override
  final Iterable<Type> types = const [Screenshot, _$Screenshot];

  @override
  final String wireName = r'Screenshot';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Screenshot object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.pathThumbnail != null) {
      yield r'pathThumbnail';
      yield serializers.serialize(
        object.pathThumbnail,
        specifiedType: const FullType(String),
      );
    }
    if (object.pathFull != null) {
      yield r'pathFull';
      yield serializers.serialize(
        object.pathFull,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Screenshot object, {
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
    required ScreenshotBuilder result,
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
        case r'pathThumbnail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.pathThumbnail = valueDes;
          break;
        case r'pathFull':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.pathFull = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Screenshot deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenshotBuilder();
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
