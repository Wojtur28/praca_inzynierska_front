// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_library.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateLibrary extends CreateLibrary {
  @override
  final String? dummy;

  factory _$CreateLibrary([void Function(CreateLibraryBuilder)? updates]) =>
      (new CreateLibraryBuilder()..update(updates))._build();

  _$CreateLibrary._({this.dummy}) : super._();

  @override
  CreateLibrary rebuild(void Function(CreateLibraryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateLibraryBuilder toBuilder() => new CreateLibraryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateLibrary && dummy == other.dummy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dummy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateLibrary')..add('dummy', dummy))
        .toString();
  }
}

class CreateLibraryBuilder
    implements Builder<CreateLibrary, CreateLibraryBuilder> {
  _$CreateLibrary? _$v;

  String? _dummy;
  String? get dummy => _$this._dummy;
  set dummy(String? dummy) => _$this._dummy = dummy;

  CreateLibraryBuilder() {
    CreateLibrary._defaults(this);
  }

  CreateLibraryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dummy = $v.dummy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateLibrary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateLibrary;
  }

  @override
  void update(void Function(CreateLibraryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateLibrary build() => _build();

  _$CreateLibrary _build() {
    final _$result = _$v ?? new _$CreateLibrary._(dummy: dummy);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
