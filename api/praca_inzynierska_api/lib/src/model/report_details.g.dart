// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportDetails extends ReportDetails {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final Date? startDate;
  @override
  final Date? endDate;
  @override
  final String? reportStatus;
  @override
  final String? reportType;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final BuiltList<SteamGame>? steamGames;
  @override
  final BuiltList<GameRating>? gameRatings;

  factory _$ReportDetails([void Function(ReportDetailsBuilder)? updates]) =>
      (new ReportDetailsBuilder()..update(updates))._build();

  _$ReportDetails._(
      {this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.reportStatus,
      this.reportType,
      this.createdAt,
      this.updatedAt,
      this.steamGames,
      this.gameRatings})
      : super._();

  @override
  ReportDetails rebuild(void Function(ReportDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportDetailsBuilder toBuilder() => new ReportDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportDetails &&
        id == other.id &&
        name == other.name &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        reportStatus == other.reportStatus &&
        reportType == other.reportType &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        steamGames == other.steamGames &&
        gameRatings == other.gameRatings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, reportStatus.hashCode);
    _$hash = $jc(_$hash, reportType.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, steamGames.hashCode);
    _$hash = $jc(_$hash, gameRatings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportDetails')
          ..add('id', id)
          ..add('name', name)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('reportStatus', reportStatus)
          ..add('reportType', reportType)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('steamGames', steamGames)
          ..add('gameRatings', gameRatings))
        .toString();
  }
}

class ReportDetailsBuilder
    implements Builder<ReportDetails, ReportDetailsBuilder> {
  _$ReportDetails? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  Date? _startDate;
  Date? get startDate => _$this._startDate;
  set startDate(Date? startDate) => _$this._startDate = startDate;

  Date? _endDate;
  Date? get endDate => _$this._endDate;
  set endDate(Date? endDate) => _$this._endDate = endDate;

  String? _reportStatus;
  String? get reportStatus => _$this._reportStatus;
  set reportStatus(String? reportStatus) => _$this._reportStatus = reportStatus;

  String? _reportType;
  String? get reportType => _$this._reportType;
  set reportType(String? reportType) => _$this._reportType = reportType;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<SteamGame>? _steamGames;
  ListBuilder<SteamGame> get steamGames =>
      _$this._steamGames ??= new ListBuilder<SteamGame>();
  set steamGames(ListBuilder<SteamGame>? steamGames) =>
      _$this._steamGames = steamGames;

  ListBuilder<GameRating>? _gameRatings;
  ListBuilder<GameRating> get gameRatings =>
      _$this._gameRatings ??= new ListBuilder<GameRating>();
  set gameRatings(ListBuilder<GameRating>? gameRatings) =>
      _$this._gameRatings = gameRatings;

  ReportDetailsBuilder() {
    ReportDetails._defaults(this);
  }

  ReportDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _reportStatus = $v.reportStatus;
      _reportType = $v.reportType;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _steamGames = $v.steamGames?.toBuilder();
      _gameRatings = $v.gameRatings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportDetails;
  }

  @override
  void update(void Function(ReportDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportDetails build() => _build();

  _$ReportDetails _build() {
    _$ReportDetails _$result;
    try {
      _$result = _$v ??
          new _$ReportDetails._(
              id: id,
              name: name,
              startDate: startDate,
              endDate: endDate,
              reportStatus: reportStatus,
              reportType: reportType,
              createdAt: createdAt,
              updatedAt: updatedAt,
              steamGames: _steamGames?.build(),
              gameRatings: _gameRatings?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'steamGames';
        _steamGames?.build();
        _$failedField = 'gameRatings';
        _gameRatings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReportDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
