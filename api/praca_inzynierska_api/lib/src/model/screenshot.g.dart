// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Screenshot extends Screenshot {
  @override
  final String? id;
  @override
  final String? pathThumbnail;
  @override
  final String? pathFull;

  factory _$Screenshot([void Function(ScreenshotBuilder)? updates]) =>
      (new ScreenshotBuilder()..update(updates))._build();

  _$Screenshot._({this.id, this.pathThumbnail, this.pathFull}) : super._();

  @override
  Screenshot rebuild(void Function(ScreenshotBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenshotBuilder toBuilder() => new ScreenshotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Screenshot &&
        id == other.id &&
        pathThumbnail == other.pathThumbnail &&
        pathFull == other.pathFull;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pathThumbnail.hashCode);
    _$hash = $jc(_$hash, pathFull.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Screenshot')
          ..add('id', id)
          ..add('pathThumbnail', pathThumbnail)
          ..add('pathFull', pathFull))
        .toString();
  }
}

class ScreenshotBuilder implements Builder<Screenshot, ScreenshotBuilder> {
  _$Screenshot? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _pathThumbnail;
  String? get pathThumbnail => _$this._pathThumbnail;
  set pathThumbnail(String? pathThumbnail) =>
      _$this._pathThumbnail = pathThumbnail;

  String? _pathFull;
  String? get pathFull => _$this._pathFull;
  set pathFull(String? pathFull) => _$this._pathFull = pathFull;

  ScreenshotBuilder() {
    Screenshot._defaults(this);
  }

  ScreenshotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _pathThumbnail = $v.pathThumbnail;
      _pathFull = $v.pathFull;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Screenshot other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Screenshot;
  }

  @override
  void update(void Function(ScreenshotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Screenshot build() => _build();

  _$Screenshot _build() {
    final _$result = _$v ??
        new _$Screenshot._(
            id: id, pathThumbnail: pathThumbnail, pathFull: pathFull);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
