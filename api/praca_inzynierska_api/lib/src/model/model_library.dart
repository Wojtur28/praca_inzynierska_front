//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:praca_inzynierska_api/src/model/library_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'model_library.g.dart';

/// ModelLibrary
///
/// Properties:
/// * [id]
/// * [userId]
/// * [libraryItems]
@BuiltValue()
abstract class ModelLibrary
    implements Built<ModelLibrary, ModelLibraryBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'libraryItems')
  BuiltList<LibraryItem>? get libraryItems;

  ModelLibrary._();

  factory ModelLibrary([void updates(ModelLibraryBuilder b)]) = _$ModelLibrary;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ModelLibraryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ModelLibrary> get serializer => _$ModelLibrarySerializer();
}

class _$ModelLibrarySerializer implements PrimitiveSerializer<ModelLibrary> {
  @override
  final Iterable<Type> types = const [ModelLibrary, _$ModelLibrary];

  @override
  final String wireName = r'ModelLibrary';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ModelLibrary object, {
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
    if (object.libraryItems != null) {
      yield r'libraryItems';
      yield serializers.serialize(
        object.libraryItems,
        specifiedType: const FullType(BuiltList, [FullType(LibraryItem)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ModelLibrary object, {
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
    required ModelLibraryBuilder result,
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
        case r'libraryItems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(LibraryItem)]),
          ) as BuiltList<LibraryItem>;
          result.libraryItems.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ModelLibrary deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelLibraryBuilder();
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
