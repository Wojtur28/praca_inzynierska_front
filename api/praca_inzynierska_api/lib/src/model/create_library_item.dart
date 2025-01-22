//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_library_item.g.dart';

/// CreateLibraryItem
///
/// Properties:
/// * [steamGameId] - ID of the Steam game to add to library.
/// * [gameStatus] - Status of the game.
@BuiltValue()
abstract class CreateLibraryItem
    implements Built<CreateLibraryItem, CreateLibraryItemBuilder> {
  /// ID of the Steam game to add to library.
  @BuiltValueField(wireName: r'steamGameId')
  String? get steamGameId;

  /// Status of the game.
  @BuiltValueField(wireName: r'gameStatus')
  CreateLibraryItemGameStatusEnum? get gameStatus;
  // enum gameStatusEnum {  NOT_STARTED,  IN_PROGRESS,  COMPLETED,  DROPPED,  };

  CreateLibraryItem._();

  factory CreateLibraryItem([void updates(CreateLibraryItemBuilder b)]) =
      _$CreateLibraryItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateLibraryItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateLibraryItem> get serializer =>
      _$CreateLibraryItemSerializer();
}

class _$CreateLibraryItemSerializer
    implements PrimitiveSerializer<CreateLibraryItem> {
  @override
  final Iterable<Type> types = const [CreateLibraryItem, _$CreateLibraryItem];

  @override
  final String wireName = r'CreateLibraryItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateLibraryItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.steamGameId != null) {
      yield r'steamGameId';
      yield serializers.serialize(
        object.steamGameId,
        specifiedType: const FullType(String),
      );
    }
    if (object.gameStatus != null) {
      yield r'gameStatus';
      yield serializers.serialize(
        object.gameStatus,
        specifiedType: const FullType(CreateLibraryItemGameStatusEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateLibraryItem object, {
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
    required CreateLibraryItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'steamGameId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.steamGameId = valueDes;
          break;
        case r'gameStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateLibraryItemGameStatusEnum),
          ) as CreateLibraryItemGameStatusEnum;
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
  CreateLibraryItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateLibraryItemBuilder();
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

class CreateLibraryItemGameStatusEnum extends EnumClass {
  /// Status of the game.
  @BuiltValueEnumConst(wireName: r'NOT_STARTED')
  static const CreateLibraryItemGameStatusEnum NOT_STARTED =
      _$createLibraryItemGameStatusEnum_NOT_STARTED;

  /// Status of the game.
  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const CreateLibraryItemGameStatusEnum IN_PROGRESS =
      _$createLibraryItemGameStatusEnum_IN_PROGRESS;

  /// Status of the game.
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const CreateLibraryItemGameStatusEnum COMPLETED =
      _$createLibraryItemGameStatusEnum_COMPLETED;

  /// Status of the game.
  @BuiltValueEnumConst(wireName: r'DROPPED')
  static const CreateLibraryItemGameStatusEnum DROPPED =
      _$createLibraryItemGameStatusEnum_DROPPED;

  static Serializer<CreateLibraryItemGameStatusEnum> get serializer =>
      _$createLibraryItemGameStatusEnumSerializer;

  const CreateLibraryItemGameStatusEnum._(String name) : super(name);

  static BuiltSet<CreateLibraryItemGameStatusEnum> get values =>
      _$createLibraryItemGameStatusEnumValues;
  static CreateLibraryItemGameStatusEnum valueOf(String name) =>
      _$createLibraryItemGameStatusEnumValueOf(name);
}
