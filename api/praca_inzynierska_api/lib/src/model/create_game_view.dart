//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_game_view.g.dart';

/// CreateGameView
///
/// Properties:
/// * [viewDuration]
/// * [viewedAt]
@BuiltValue()
abstract class CreateGameView
    implements Built<CreateGameView, CreateGameViewBuilder> {
  @BuiltValueField(wireName: r'viewDuration')
  int? get viewDuration;

  @BuiltValueField(wireName: r'viewedAt')
  DateTime? get viewedAt;

  CreateGameView._();

  factory CreateGameView([void updates(CreateGameViewBuilder b)]) =
      _$CreateGameView;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateGameViewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateGameView> get serializer =>
      _$CreateGameViewSerializer();
}

class _$CreateGameViewSerializer
    implements PrimitiveSerializer<CreateGameView> {
  @override
  final Iterable<Type> types = const [CreateGameView, _$CreateGameView];

  @override
  final String wireName = r'CreateGameView';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateGameView object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.viewDuration != null) {
      yield r'viewDuration';
      yield serializers.serialize(
        object.viewDuration,
        specifiedType: const FullType(int),
      );
    }
    if (object.viewedAt != null) {
      yield r'viewedAt';
      yield serializers.serialize(
        object.viewedAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateGameView object, {
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
    required CreateGameViewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'viewDuration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.viewDuration = valueDes;
          break;
        case r'viewedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.viewedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateGameView deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateGameViewBuilder();
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
