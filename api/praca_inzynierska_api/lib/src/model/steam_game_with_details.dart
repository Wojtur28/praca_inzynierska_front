//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:praca_inzynierska_api/src/model/category.dart';
import 'package:built_collection/built_collection.dart';
import 'package:praca_inzynierska_api/src/model/date.dart';
import 'package:praca_inzynierska_api/src/model/genre.dart';
import 'package:praca_inzynierska_api/src/model/steam_game.dart';
import 'package:praca_inzynierska_api/src/model/platform.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'steam_game_with_details.g.dart';

/// SteamGameWithDetails
///
/// Properties:
/// * [id] - Unique identifier of the Steam game.
/// * [appId] - Steam API identifier for the game.
/// * [title] - Title of the game.
/// * [reviewsTotal] - Total number of reviews for the game.
/// * [reviewsScoreFancy] - Average review score in a fancy format (e.g., \"Very Positive\").
/// * [releaseDate] - Release date of the game.
/// * [launchPrice] - Launch price of the game.
/// * [tags] - Tags associated with the game, stored as a comma-separated string.
/// * [steamPage] - URL to the game's Steam page.
/// * [detailId] - Unique identifier of the Steam game details.
/// * [headerImage] - URL to the header image of the game.
/// * [capsuleImage] - URL to the capsule image of the game.
/// * [developer] - Developer of the game.
/// * [publisher] - Publisher of the game.
/// * [requiredAge] - Required age to play the game.
/// * [supportedLanguages] - Comma-separated list of supported languages for the game.
/// * [categories] - List of categories associated with the game.
/// * [genres] - List of genres associated with the game.
/// * [platforms] - List of platforms supported by the game.
@BuiltValue()
abstract class SteamGameWithDetails
    implements
        SteamGame,
        Built<SteamGameWithDetails, SteamGameWithDetailsBuilder> {
  /// Required age to play the game.
  @BuiltValueField(wireName: r'requiredAge')
  int? get requiredAge;

  /// Comma-separated list of supported languages for the game.
  @BuiltValueField(wireName: r'supportedLanguages')
  String? get supportedLanguages;

  /// URL to the header image of the game.
  @BuiltValueField(wireName: r'headerImage')
  String? get headerImage;

  /// List of genres associated with the game.
  @BuiltValueField(wireName: r'genres')
  BuiltList<Genre>? get genres;

  /// Unique identifier of the Steam game details.
  @BuiltValueField(wireName: r'detailId')
  String? get detailId;

  /// Publisher of the game.
  @BuiltValueField(wireName: r'publisher')
  String? get publisher;

  /// Developer of the game.
  @BuiltValueField(wireName: r'developer')
  String? get developer;

  /// URL to the capsule image of the game.
  @BuiltValueField(wireName: r'capsuleImage')
  String? get capsuleImage;

  /// List of categories associated with the game.
  @BuiltValueField(wireName: r'categories')
  BuiltList<Category>? get categories;

  /// List of platforms supported by the game.
  @BuiltValueField(wireName: r'platforms')
  BuiltList<Platform>? get platforms;

  SteamGameWithDetails._();

  factory SteamGameWithDetails([void updates(SteamGameWithDetailsBuilder b)]) =
      _$SteamGameWithDetails;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SteamGameWithDetailsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SteamGameWithDetails> get serializer =>
      _$SteamGameWithDetailsSerializer();
}

class _$SteamGameWithDetailsSerializer
    implements PrimitiveSerializer<SteamGameWithDetails> {
  @override
  final Iterable<Type> types = const [
    SteamGameWithDetails,
    _$SteamGameWithDetails
  ];

  @override
  final String wireName = r'SteamGameWithDetails';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SteamGameWithDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.launchPrice != null) {
      yield r'launchPrice';
      yield serializers.serialize(
        object.launchPrice,
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
    if (object.releaseDate != null) {
      yield r'releaseDate';
      yield serializers.serialize(
        object.releaseDate,
        specifiedType: const FullType(Date),
      );
    }
    if (object.reviewsTotal != null) {
      yield r'reviewsTotal';
      yield serializers.serialize(
        object.reviewsTotal,
        specifiedType: const FullType(int),
      );
    }
    if (object.detailId != null) {
      yield r'detailId';
      yield serializers.serialize(
        object.detailId,
        specifiedType: const FullType(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.reviewsScoreFancy != null) {
      yield r'reviewsScoreFancy';
      yield serializers.serialize(
        object.reviewsScoreFancy,
        specifiedType: const FullType(String),
      );
    }
    if (object.platforms != null) {
      yield r'platforms';
      yield serializers.serialize(
        object.platforms,
        specifiedType: const FullType(BuiltList, [FullType(Platform)]),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
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
    if (object.headerImage != null) {
      yield r'headerImage';
      yield serializers.serialize(
        object.headerImage,
        specifiedType: const FullType(String),
      );
    }
    if (object.genres != null) {
      yield r'genres';
      yield serializers.serialize(
        object.genres,
        specifiedType: const FullType(BuiltList, [FullType(Genre)]),
      );
    }
    if (object.appId != null) {
      yield r'appId';
      yield serializers.serialize(
        object.appId,
        specifiedType: const FullType(int),
      );
    }
    if (object.steamPage != null) {
      yield r'steamPage';
      yield serializers.serialize(
        object.steamPage,
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
    if (object.developer != null) {
      yield r'developer';
      yield serializers.serialize(
        object.developer,
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
    if (object.categories != null) {
      yield r'categories';
      yield serializers.serialize(
        object.categories,
        specifiedType: const FullType(BuiltList, [FullType(Category)]),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SteamGameWithDetails object, {
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
    required SteamGameWithDetailsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'launchPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.launchPrice = valueDes;
          break;
        case r'requiredAge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.requiredAge = valueDes;
          break;
        case r'releaseDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.releaseDate = valueDes;
          break;
        case r'reviewsTotal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.reviewsTotal = valueDes;
          break;
        case r'detailId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.detailId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'reviewsScoreFancy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reviewsScoreFancy = valueDes;
          break;
        case r'platforms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Platform)]),
          ) as BuiltList<Platform>;
          result.platforms.replace(valueDes);
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tags = valueDes;
          break;
        case r'supportedLanguages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.supportedLanguages = valueDes;
          break;
        case r'headerImage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.headerImage = valueDes;
          break;
        case r'genres':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Genre)]),
          ) as BuiltList<Genre>;
          result.genres.replace(valueDes);
          break;
        case r'appId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.appId = valueDes;
          break;
        case r'steamPage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.steamPage = valueDes;
          break;
        case r'publisher':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.publisher = valueDes;
          break;
        case r'developer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.developer = valueDes;
          break;
        case r'capsuleImage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.capsuleImage = valueDes;
          break;
        case r'categories':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Category)]),
          ) as BuiltList<Category>;
          result.categories.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SteamGameWithDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SteamGameWithDetailsBuilder();
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
