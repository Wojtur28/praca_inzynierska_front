// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SteamUser extends SteamUser {
  @override
  final String? id;
  @override
  final String? steamId;
  @override
  final BuiltList<SteamReview>? steamReviews;

  factory _$SteamUser([void Function(SteamUserBuilder)? updates]) =>
      (new SteamUserBuilder()..update(updates))._build();

  _$SteamUser._({this.id, this.steamId, this.steamReviews}) : super._();

  @override
  SteamUser rebuild(void Function(SteamUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SteamUserBuilder toBuilder() => new SteamUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SteamUser &&
        id == other.id &&
        steamId == other.steamId &&
        steamReviews == other.steamReviews;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, steamId.hashCode);
    _$hash = $jc(_$hash, steamReviews.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SteamUser')
          ..add('id', id)
          ..add('steamId', steamId)
          ..add('steamReviews', steamReviews))
        .toString();
  }
}

class SteamUserBuilder implements Builder<SteamUser, SteamUserBuilder> {
  _$SteamUser? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _steamId;
  String? get steamId => _$this._steamId;
  set steamId(String? steamId) => _$this._steamId = steamId;

  ListBuilder<SteamReview>? _steamReviews;
  ListBuilder<SteamReview> get steamReviews =>
      _$this._steamReviews ??= new ListBuilder<SteamReview>();
  set steamReviews(ListBuilder<SteamReview>? steamReviews) =>
      _$this._steamReviews = steamReviews;

  SteamUserBuilder() {
    SteamUser._defaults(this);
  }

  SteamUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _steamId = $v.steamId;
      _steamReviews = $v.steamReviews?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SteamUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SteamUser;
  }

  @override
  void update(void Function(SteamUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SteamUser build() => _build();

  _$SteamUser _build() {
    _$SteamUser _$result;
    try {
      _$result = _$v ??
          new _$SteamUser._(
              id: id, steamId: steamId, steamReviews: _steamReviews?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'steamReviews';
        _steamReviews?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SteamUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
