// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GameView extends GameView {
  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? steamGameId;
  @override
  final int? viewDuration;
  @override
  final DateTime? viewedAt;

  factory _$GameView([void Function(GameViewBuilder)? updates]) =>
      (new GameViewBuilder()..update(updates))._build();

  _$GameView._(
      {this.id,
      this.userId,
      this.steamGameId,
      this.viewDuration,
      this.viewedAt})
      : super._();

  @override
  GameView rebuild(void Function(GameViewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameViewBuilder toBuilder() => new GameViewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameView &&
        id == other.id &&
        userId == other.userId &&
        steamGameId == other.steamGameId &&
        viewDuration == other.viewDuration &&
        viewedAt == other.viewedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, steamGameId.hashCode);
    _$hash = $jc(_$hash, viewDuration.hashCode);
    _$hash = $jc(_$hash, viewedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GameView')
          ..add('id', id)
          ..add('userId', userId)
          ..add('steamGameId', steamGameId)
          ..add('viewDuration', viewDuration)
          ..add('viewedAt', viewedAt))
        .toString();
  }
}

class GameViewBuilder implements Builder<GameView, GameViewBuilder> {
  _$GameView? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _steamGameId;
  String? get steamGameId => _$this._steamGameId;
  set steamGameId(String? steamGameId) => _$this._steamGameId = steamGameId;

  int? _viewDuration;
  int? get viewDuration => _$this._viewDuration;
  set viewDuration(int? viewDuration) => _$this._viewDuration = viewDuration;

  DateTime? _viewedAt;
  DateTime? get viewedAt => _$this._viewedAt;
  set viewedAt(DateTime? viewedAt) => _$this._viewedAt = viewedAt;

  GameViewBuilder() {
    GameView._defaults(this);
  }

  GameViewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _steamGameId = $v.steamGameId;
      _viewDuration = $v.viewDuration;
      _viewedAt = $v.viewedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameView other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameView;
  }

  @override
  void update(void Function(GameViewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GameView build() => _build();

  _$GameView _build() {
    final _$result = _$v ??
        new _$GameView._(
            id: id,
            userId: userId,
            steamGameId: steamGameId,
            viewDuration: viewDuration,
            viewedAt: viewedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
