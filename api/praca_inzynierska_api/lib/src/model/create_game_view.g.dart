// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_game_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateGameView extends CreateGameView {
  @override
  final int? viewDuration;
  @override
  final DateTime? viewedAt;

  factory _$CreateGameView([void Function(CreateGameViewBuilder)? updates]) =>
      (new CreateGameViewBuilder()..update(updates))._build();

  _$CreateGameView._({this.viewDuration, this.viewedAt}) : super._();

  @override
  CreateGameView rebuild(void Function(CreateGameViewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateGameViewBuilder toBuilder() =>
      new CreateGameViewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateGameView &&
        viewDuration == other.viewDuration &&
        viewedAt == other.viewedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, viewDuration.hashCode);
    _$hash = $jc(_$hash, viewedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateGameView')
          ..add('viewDuration', viewDuration)
          ..add('viewedAt', viewedAt))
        .toString();
  }
}

class CreateGameViewBuilder
    implements Builder<CreateGameView, CreateGameViewBuilder> {
  _$CreateGameView? _$v;

  int? _viewDuration;
  int? get viewDuration => _$this._viewDuration;
  set viewDuration(int? viewDuration) => _$this._viewDuration = viewDuration;

  DateTime? _viewedAt;
  DateTime? get viewedAt => _$this._viewedAt;
  set viewedAt(DateTime? viewedAt) => _$this._viewedAt = viewedAt;

  CreateGameViewBuilder() {
    CreateGameView._defaults(this);
  }

  CreateGameViewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _viewDuration = $v.viewDuration;
      _viewedAt = $v.viewedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateGameView other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateGameView;
  }

  @override
  void update(void Function(CreateGameViewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateGameView build() => _build();

  _$CreateGameView _build() {
    final _$result = _$v ??
        new _$CreateGameView._(viewDuration: viewDuration, viewedAt: viewedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
