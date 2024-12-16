// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Platform extends Platform {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final bool? isSupport;

  factory _$Platform([void Function(PlatformBuilder)? updates]) =>
      (new PlatformBuilder()..update(updates))._build();

  _$Platform._({this.id, this.name, this.isSupport}) : super._();

  @override
  Platform rebuild(void Function(PlatformBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlatformBuilder toBuilder() => new PlatformBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Platform &&
        id == other.id &&
        name == other.name &&
        isSupport == other.isSupport;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, isSupport.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Platform')
          ..add('id', id)
          ..add('name', name)
          ..add('isSupport', isSupport))
        .toString();
  }
}

class PlatformBuilder implements Builder<Platform, PlatformBuilder> {
  _$Platform? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isSupport;
  bool? get isSupport => _$this._isSupport;
  set isSupport(bool? isSupport) => _$this._isSupport = isSupport;

  PlatformBuilder() {
    Platform._defaults(this);
  }

  PlatformBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _isSupport = $v.isSupport;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Platform other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Platform;
  }

  @override
  void update(void Function(PlatformBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Platform build() => _build();

  _$Platform _build() {
    final _$result =
        _$v ?? new _$Platform._(id: id, name: name, isSupport: isSupport);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
