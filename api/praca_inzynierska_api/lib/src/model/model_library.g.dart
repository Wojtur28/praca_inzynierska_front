// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_library.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelLibrary extends ModelLibrary {
  @override
  final String? id;
  @override
  final String? userId;
  @override
  final BuiltList<LibraryItem>? libraryItems;

  factory _$ModelLibrary([void Function(ModelLibraryBuilder)? updates]) =>
      (new ModelLibraryBuilder()..update(updates))._build();

  _$ModelLibrary._({this.id, this.userId, this.libraryItems}) : super._();

  @override
  ModelLibrary rebuild(void Function(ModelLibraryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelLibraryBuilder toBuilder() => new ModelLibraryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelLibrary &&
        id == other.id &&
        userId == other.userId &&
        libraryItems == other.libraryItems;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, libraryItems.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelLibrary')
          ..add('id', id)
          ..add('userId', userId)
          ..add('libraryItems', libraryItems))
        .toString();
  }
}

class ModelLibraryBuilder
    implements Builder<ModelLibrary, ModelLibraryBuilder> {
  _$ModelLibrary? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ListBuilder<LibraryItem>? _libraryItems;
  ListBuilder<LibraryItem> get libraryItems =>
      _$this._libraryItems ??= new ListBuilder<LibraryItem>();
  set libraryItems(ListBuilder<LibraryItem>? libraryItems) =>
      _$this._libraryItems = libraryItems;

  ModelLibraryBuilder() {
    ModelLibrary._defaults(this);
  }

  ModelLibraryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _libraryItems = $v.libraryItems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelLibrary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelLibrary;
  }

  @override
  void update(void Function(ModelLibraryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelLibrary build() => _build();

  _$ModelLibrary _build() {
    _$ModelLibrary _$result;
    try {
      _$result = _$v ??
          new _$ModelLibrary._(
              id: id, userId: userId, libraryItems: _libraryItems?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'libraryItems';
        _libraryItems?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelLibrary', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
