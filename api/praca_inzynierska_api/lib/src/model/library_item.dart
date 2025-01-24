//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:praca_inzynierska_api/src/model/steam_game.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'library_item.g.dart';

/// LibraryItem
///
/// Properties:
/// * [id]
/// * [steamGame]
/// * [gameStatus] - Status of the game in the library.
@BuiltValue()
abstract class LibraryItem implements Built<LibraryItem, LibraryItemBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'steamGame')
  SteamGame? get steamGame;

  /// Status of the game in the library.
  @BuiltValueField(wireName: r'gameStatus')
  LibraryItemGameStatusEnum? get gameStatus;
  // enum gameStatusEnum {  NOT_STARTED,  IN_PROGRESS,  COMPLETED,  DROPPED,  };

  LibraryItem._();

  factory LibraryItem([void updates(LibraryItemBuilder b)]) = _$LibraryItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LibraryItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LibraryItem> get serializer => _$LibraryItemSerializer();
}

class _$LibraryItemSerializer implements PrimitiveSerializer<LibraryItem> {
  @override
  final Iterable<Type> types = const [LibraryItem, _$LibraryItem];

  @override
  final String wireName = r'LibraryItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LibraryItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.steamGame != null) {
      yield r'steamGame';
      yield serializers.serialize(
        object.steamGame,
        specifiedType: const FullType(SteamGame),
      );
    }
    if (object.gameStatus != null) {
      yield r'gameStatus';
      yield serializers.serialize(
        object.gameStatus,
        specifiedType: const FullType(LibraryItemGameStatusEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    LibraryItem object, {
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
    required LibraryItemBuilder result,
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
        case r'steamGame':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SteamGame),
          ) as SteamGame;
          result.steamGame = valueDes;
          break;
        case r'gameStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LibraryItemGameStatusEnum),
          ) as LibraryItemGameStatusEnum;
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
  LibraryItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LibraryItemBuilder();
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

class LibraryItemGameStatusEnum extends EnumClass {
  /// Status of the game in the library.
  @BuiltValueEnumConst(wireName: r'NOT_STARTED')
  static const LibraryItemGameStatusEnum NOT_STARTED =
      _$libraryItemGameStatusEnum_NOT_STARTED;

  /// Status of the game in the library.
  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const LibraryItemGameStatusEnum IN_PROGRESS =
      _$libraryItemGameStatusEnum_IN_PROGRESS;

  /// Status of the game in the library.
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const LibraryItemGameStatusEnum COMPLETED =
      _$libraryItemGameStatusEnum_COMPLETED;

  /// Status of the game in the library.
  @BuiltValueEnumConst(wireName: r'DROPPED')
  static const LibraryItemGameStatusEnum DROPPED =
      _$libraryItemGameStatusEnum_DROPPED;

  static Serializer<LibraryItemGameStatusEnum> get serializer =>
      _$libraryItemGameStatusEnumSerializer;

  const LibraryItemGameStatusEnum._(String name) : super(name);

  static BuiltSet<LibraryItemGameStatusEnum> get values =>
      _$libraryItemGameStatusEnumValues;
  static LibraryItemGameStatusEnum valueOf(String name) =>
      _$libraryItemGameStatusEnumValueOf(name);
}
