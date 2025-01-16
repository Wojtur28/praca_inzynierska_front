// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Report extends Report {
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final BuiltList<SteamGame>? steamGames;
  @override
  final BuiltList<GameRating>? gameRatings;
  @override
  final BuiltList<User>? users;

  factory _$Report([void Function(ReportBuilder)? updates]) =>
      (new ReportBuilder()..update(updates))._build();

  _$Report._(
      {this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.reportStatus,
      this.createdAt,
      this.updatedAt,
      this.steamGames,
      this.gameRatings,
      this.users})
      : super._();

  @override
  Report rebuild(void Function(ReportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportBuilder toBuilder() => new ReportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Report &&
        id == other.id &&
        name == other.name &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        reportStatus == other.reportStatus &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        steamGames == other.steamGames &&
        gameRatings == other.gameRatings &&
        users == other.users;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, reportStatus.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, steamGames.hashCode);
    _$hash = $jc(_$hash, gameRatings.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Report')
          ..add('id', id)
          ..add('name', name)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('reportStatus', reportStatus)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('steamGames', steamGames)
          ..add('gameRatings', gameRatings)
          ..add('users', users))
        .toString();
  }
}

class ReportBuilder implements Builder<Report, ReportBuilder> {
  _$Report? _$v;

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

  ListBuilder<User>? _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User>? users) => _$this._users = users;

  ReportBuilder() {
    Report._defaults(this);
  }

  ReportBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _reportStatus = $v.reportStatus;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _steamGames = $v.steamGames?.toBuilder();
      _gameRatings = $v.gameRatings?.toBuilder();
      _users = $v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Report other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Report;
  }

  @override
  void update(void Function(ReportBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Report build() => _build();

  _$Report _build() {
    _$Report _$result;
    try {
      _$result = _$v ??
          new _$Report._(
              id: id,
              name: name,
              startDate: startDate,
              endDate: endDate,
              reportStatus: reportStatus,
              createdAt: createdAt,
              updatedAt: updatedAt,
              steamGames: _steamGames?.build(),
              gameRatings: _gameRatings?.build(),
              users: _users?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'steamGames';
        _steamGames?.build();
        _$failedField = 'gameRatings';
        _gameRatings?.build();
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Report', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
