//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:praca_inzynierska_api/src/model/steam_review.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'steam_user.g.dart';

/// SteamUser
///
/// Properties:
/// * [id] - Unique identifier of the Steam user.
/// * [steamId] - Unique Steam ID of the user.
/// * [steamReviews] - List of reviews written by the user.
@BuiltValue()
abstract class SteamUser implements Built<SteamUser, SteamUserBuilder> {
  /// Unique identifier of the Steam user.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Unique Steam ID of the user.
  @BuiltValueField(wireName: r'steamId')
  String? get steamId;

  /// List of reviews written by the user.
  @BuiltValueField(wireName: r'steamReviews')
  BuiltList<SteamReview>? get steamReviews;

  SteamUser._();

  factory SteamUser([void updates(SteamUserBuilder b)]) = _$SteamUser;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SteamUserBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SteamUser> get serializer => _$SteamUserSerializer();
}

class _$SteamUserSerializer implements PrimitiveSerializer<SteamUser> {
  @override
  final Iterable<Type> types = const [SteamUser, _$SteamUser];

  @override
  final String wireName = r'SteamUser';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SteamUser object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.steamId != null) {
      yield r'steamId';
      yield serializers.serialize(
        object.steamId,
        specifiedType: const FullType(String),
      );
    }
    if (object.steamReviews != null) {
      yield r'steamReviews';
      yield serializers.serialize(
        object.steamReviews,
        specifiedType: const FullType(BuiltList, [FullType(SteamReview)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SteamUser object, {
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
    required SteamUserBuilder result,
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
        case r'steamId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.steamId = valueDes;
          break;
        case r'steamReviews':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SteamReview)]),
          ) as BuiltList<SteamReview>;
          result.steamReviews.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SteamUser deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SteamUserBuilder();
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
