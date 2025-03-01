//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:praca_inzynierska_api/src/model/game_rating.dart';
import 'package:built_collection/built_collection.dart';
import 'package:praca_inzynierska_api/src/model/date.dart';
import 'package:praca_inzynierska_api/src/model/steam_game.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_details.g.dart';

/// ReportDetails
///
/// Properties:
/// * [id] - Unique identifier of the report.
/// * [name] - Name of the report.
/// * [startDate] - Start date of the report.
/// * [endDate] - End date of the report.
/// * [reportStatus] - Status of the report.
/// * [reportType] - Type of the report.
/// * [createdAt] - Timestamp when the report was created.
/// * [updatedAt] - Timestamp when the report was last updated.
/// * [steamGames] - List of Steam games included in the report.
/// * [gameRatings] - List of game ratings included in the report.
@BuiltValue()
abstract class ReportDetails
    implements Built<ReportDetails, ReportDetailsBuilder> {
  /// Unique identifier of the report.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Name of the report.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Start date of the report.
  @BuiltValueField(wireName: r'startDate')
  Date? get startDate;

  /// End date of the report.
  @BuiltValueField(wireName: r'endDate')
  Date? get endDate;

  /// Status of the report.
  @BuiltValueField(wireName: r'reportStatus')
  String? get reportStatus;

  /// Type of the report.
  @BuiltValueField(wireName: r'reportType')
  String? get reportType;

  /// Timestamp when the report was created.
  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  /// Timestamp when the report was last updated.
  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  /// List of Steam games included in the report.
  @BuiltValueField(wireName: r'steamGames')
  BuiltList<SteamGame>? get steamGames;

  /// List of game ratings included in the report.
  @BuiltValueField(wireName: r'gameRatings')
  BuiltList<GameRating>? get gameRatings;

  ReportDetails._();

  factory ReportDetails([void updates(ReportDetailsBuilder b)]) =
      _$ReportDetails;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportDetailsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportDetails> get serializer =>
      _$ReportDetailsSerializer();
}

class _$ReportDetailsSerializer implements PrimitiveSerializer<ReportDetails> {
  @override
  final Iterable<Type> types = const [ReportDetails, _$ReportDetails];

  @override
  final String wireName = r'ReportDetails';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.startDate != null) {
      yield r'startDate';
      yield serializers.serialize(
        object.startDate,
        specifiedType: const FullType(Date),
      );
    }
    if (object.endDate != null) {
      yield r'endDate';
      yield serializers.serialize(
        object.endDate,
        specifiedType: const FullType(Date),
      );
    }
    if (object.reportStatus != null) {
      yield r'reportStatus';
      yield serializers.serialize(
        object.reportStatus,
        specifiedType: const FullType(String),
      );
    }
    if (object.reportType != null) {
      yield r'reportType';
      yield serializers.serialize(
        object.reportType,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.steamGames != null) {
      yield r'steamGames';
      yield serializers.serialize(
        object.steamGames,
        specifiedType: const FullType(BuiltList, [FullType(SteamGame)]),
      );
    }
    if (object.gameRatings != null) {
      yield r'gameRatings';
      yield serializers.serialize(
        object.gameRatings,
        specifiedType: const FullType(BuiltList, [FullType(GameRating)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportDetails object, {
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
    required ReportDetailsBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'startDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.startDate = valueDes;
          break;
        case r'endDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.endDate = valueDes;
          break;
        case r'reportStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reportStatus = valueDes;
          break;
        case r'reportType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reportType = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'steamGames':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SteamGame)]),
          ) as BuiltList<SteamGame>;
          result.steamGames.replace(valueDes);
          break;
        case r'gameRatings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(GameRating)]),
          ) as BuiltList<GameRating>;
          result.gameRatings.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportDetailsBuilder();
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
