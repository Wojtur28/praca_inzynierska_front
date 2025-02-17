//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'game_view.g.dart';

/// GameView
///
/// Properties:
/// * [id]
/// * [userId]
/// * [steamGameId]
/// * [viewDuration]
/// * [viewedAt]
@BuiltValue()
abstract class GameView implements Built<GameView, GameViewBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'steamGameId')
  String? get steamGameId;

  @BuiltValueField(wireName: r'viewDuration')
  int? get viewDuration;

  @BuiltValueField(wireName: r'viewedAt')
  DateTime? get viewedAt;

  GameView._();

  factory GameView([void updates(GameViewBuilder b)]) = _$GameView;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GameViewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GameView> get serializer => _$GameViewSerializer();
}

class _$GameViewSerializer implements PrimitiveSerializer<GameView> {
  @override
  final Iterable<Type> types = const [GameView, _$GameView];

  @override
  final String wireName = r'GameView';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GameView object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.steamGameId != null) {
      yield r'steamGameId';
      yield serializers.serialize(
        object.steamGameId,
        specifiedType: const FullType(String),
      );
    }
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
    GameView object, {
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
    required GameViewBuilder result,
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
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'steamGameId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.steamGameId = valueDes;
          break;
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
  GameView deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GameViewBuilder();
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
