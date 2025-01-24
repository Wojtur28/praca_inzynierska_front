//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_library_item.g.dart';

/// UpdateLibraryItem
///
/// Properties:
/// * [gameStatus] - New status of the game.
@BuiltValue()
abstract class UpdateLibraryItem
    implements Built<UpdateLibraryItem, UpdateLibraryItemBuilder> {
  /// New status of the game.
  @BuiltValueField(wireName: r'gameStatus')
  UpdateLibraryItemGameStatusEnum? get gameStatus;
  // enum gameStatusEnum {  NOT_STARTED,  IN_PROGRESS,  COMPLETED,  DROPPED,  };

  UpdateLibraryItem._();

  factory UpdateLibraryItem([void updates(UpdateLibraryItemBuilder b)]) =
      _$UpdateLibraryItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateLibraryItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateLibraryItem> get serializer =>
      _$UpdateLibraryItemSerializer();
}

class _$UpdateLibraryItemSerializer
    implements PrimitiveSerializer<UpdateLibraryItem> {
  @override
  final Iterable<Type> types = const [UpdateLibraryItem, _$UpdateLibraryItem];

  @override
  final String wireName = r'UpdateLibraryItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateLibraryItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.gameStatus != null) {
      yield r'gameStatus';
      yield serializers.serialize(
        object.gameStatus,
        specifiedType: const FullType(UpdateLibraryItemGameStatusEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateLibraryItem object, {
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
    required UpdateLibraryItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'gameStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpdateLibraryItemGameStatusEnum),
          ) as UpdateLibraryItemGameStatusEnum;
          result.gameStatus = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateLibraryItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateLibraryItemBuilder();
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

class UpdateLibraryItemGameStatusEnum extends EnumClass {
  /// New status of the game.
  @BuiltValueEnumConst(wireName: r'NOT_STARTED')
  static const UpdateLibraryItemGameStatusEnum NOT_STARTED =
      _$updateLibraryItemGameStatusEnum_NOT_STARTED;

  /// New status of the game.
  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const UpdateLibraryItemGameStatusEnum IN_PROGRESS =
      _$updateLibraryItemGameStatusEnum_IN_PROGRESS;

  /// New status of the game.
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const UpdateLibraryItemGameStatusEnum COMPLETED =
      _$updateLibraryItemGameStatusEnum_COMPLETED;

  /// New status of the game.
  @BuiltValueEnumConst(wireName: r'DROPPED')
  static const UpdateLibraryItemGameStatusEnum DROPPED =
      _$updateLibraryItemGameStatusEnum_DROPPED;

  static Serializer<UpdateLibraryItemGameStatusEnum> get serializer =>
      _$updateLibraryItemGameStatusEnumSerializer;

  const UpdateLibraryItemGameStatusEnum._(String name) : super(name);

  static BuiltSet<UpdateLibraryItemGameStatusEnum> get values =>
      _$updateLibraryItemGameStatusEnumValues;
  static UpdateLibraryItemGameStatusEnum valueOf(String name) =>
      _$updateLibraryItemGameStatusEnumValueOf(name);
}
