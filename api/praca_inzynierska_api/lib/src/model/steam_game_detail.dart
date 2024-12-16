//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:praca_inzynierska_api/src/model/category.dart';
import 'package:built_collection/built_collection.dart';
import 'package:praca_inzynierska_api/src/model/genre.dart';
import 'package:praca_inzynierska_api/src/model/platform.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'steam_game_detail.g.dart';

/// SteamGameDetail
///
/// Properties:
/// * [id] - Unique identifier of the Steam game details.
/// * [headerImage] - URL to the header image of the game.
/// * [capsuleImage] - URL to the capsule image of the game.
/// * [website] - Official website of the game.
/// * [developer] - Developer of the game.
/// * [publisher] - Publisher of the game.
/// * [requiredAge] - Required age to play the game.
/// * [shortDescription] - Short description of the game.
/// * [supportedLanguages] - Comma-separated list of supported languages for the game.
/// * [categories] - List of categories associated with the game.
/// * [genres] - List of genres associated with the game.
/// * [platforms] - List of platforms supported by the game.
@BuiltValue()
abstract class SteamGameDetail
    implements Built<SteamGameDetail, SteamGameDetailBuilder> {
  /// Unique identifier of the Steam game details.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// URL to the header image of the game.
  @BuiltValueField(wireName: r'headerImage')
  String? get headerImage;

  /// URL to the capsule image of the game.
  @BuiltValueField(wireName: r'capsuleImage')
  String? get capsuleImage;

  /// Official website of the game.
  @BuiltValueField(wireName: r'website')
  String? get website;

  /// Developer of the game.
  @BuiltValueField(wireName: r'developer')
  String? get developer;

  /// Publisher of the game.
  @BuiltValueField(wireName: r'publisher')
  String? get publisher;

  /// Required age to play the game.
  @BuiltValueField(wireName: r'requiredAge')
  int? get requiredAge;

  /// Short description of the game.
  @BuiltValueField(wireName: r'shortDescription')
  String? get shortDescription;

  /// Comma-separated list of supported languages for the game.
  @BuiltValueField(wireName: r'supportedLanguages')
  String? get supportedLanguages;

  /// List of categories associated with the game.
  @BuiltValueField(wireName: r'categories')
  BuiltList<Category>? get categories;

  /// List of genres associated with the game.
  @BuiltValueField(wireName: r'genres')
  BuiltList<Genre>? get genres;

  /// List of platforms supported by the game.
  @BuiltValueField(wireName: r'platforms')
  BuiltList<Platform>? get platforms;

  SteamGameDetail._();

  factory SteamGameDetail([void updates(SteamGameDetailBuilder b)]) =
      _$SteamGameDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SteamGameDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SteamGameDetail> get serializer =>
      _$SteamGameDetailSerializer();
}

class _$SteamGameDetailSerializer
    implements PrimitiveSerializer<SteamGameDetail> {
  @override
  final Iterable<Type> types = const [SteamGameDetail, _$SteamGameDetail];

  @override
  final String wireName = r'SteamGameDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SteamGameDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.headerImage != null) {
      yield r'headerImage';
      yield serializers.serialize(
        object.headerImage,
        specifiedType: const FullType(String),
      );
    }
    if (object.capsuleImage != null) {
      yield r'capsuleImage';
      yield serializers.serialize(
        object.capsuleImage,
        specifiedType: const FullType(String),
      );
    }
    if (object.website != null) {
      yield r'website';
      yield serializers.serialize(
        object.website,
        specifiedType: const FullType(String),
      );
    }
    if (object.developer != null) {
      yield r'developer';
      yield serializers.serialize(
        object.developer,
        specifiedType: const FullType(String),
      );
    }
    if (object.publisher != null) {
      yield r'publisher';
      yield serializers.serialize(
        object.publisher,
        specifiedType: const FullType(String),
      );
    }
    if (object.requiredAge != null) {
      yield r'requiredAge';
      yield serializers.serialize(
        object.requiredAge,
        specifiedType: const FullType(int),
      );
    }
    if (object.shortDescription != null) {
      yield r'shortDescription';
      yield serializers.serialize(
        object.shortDescription,
        specifiedType: const FullType(String),
      );
    }
    if (object.supportedLanguages != null) {
      yield r'supportedLanguages';
      yield serializers.serialize(
        object.supportedLanguages,
        specifiedType: const FullType(String),
      );
    }
    if (object.categories != null) {
      yield r'categories';
      yield serializers.serialize(
        object.categories,
        specifiedType: const FullType(BuiltList, [FullType(Category)]),
      );
    }
    if (object.genres != null) {
      yield r'genres';
      yield serializers.serialize(
        object.genres,
        specifiedType: const FullType(BuiltList, [FullType(Genre)]),
      );
    }
    if (object.platforms != null) {
      yield r'platforms';
      yield serializers.serialize(
        object.platforms,
        specifiedType: const FullType(BuiltList, [FullType(Platform)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SteamGameDetail object, {
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
    required SteamGameDetailBuilder result,
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
        case r'headerImage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.headerImage = valueDes;
          break;
        case r'capsuleImage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.capsuleImage = valueDes;
          break;
        case r'website':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.website = valueDes;
          break;
        case r'developer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.developer = valueDes;
          break;
        case r'publisher':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.publisher = valueDes;
          break;
        case r'requiredAge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.requiredAge = valueDes;
          break;
        case r'shortDescription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shortDescription = valueDes;
          break;
        case r'supportedLanguages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.supportedLanguages = valueDes;
          break;
        case r'categories':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Category)]),
          ) as BuiltList<Category>;
          result.categories.replace(valueDes);
          break;
        case r'genres':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Genre)]),
          ) as BuiltList<Genre>;
          result.genres.replace(valueDes);
          break;
        case r'platforms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Platform)]),
          ) as BuiltList<Platform>;
          result.platforms.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SteamGameDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SteamGameDetailBuilder();
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
