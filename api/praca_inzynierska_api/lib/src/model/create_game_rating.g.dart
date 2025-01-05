// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_game_rating.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateGameRating extends CreateGameRating {
  @override
  final int? rating;
  @override
  final String? content;

  factory _$CreateGameRating(
          [void Function(CreateGameRatingBuilder)? updates]) =>
      (new CreateGameRatingBuilder()..update(updates))._build();

  _$CreateGameRating._({this.rating, this.content}) : super._();

  @override
  CreateGameRating rebuild(void Function(CreateGameRatingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateGameRatingBuilder toBuilder() =>
      new CreateGameRatingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateGameRating &&
        rating == other.rating &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateGameRating')
          ..add('rating', rating)
          ..add('content', content))
        .toString();
  }
}

class CreateGameRatingBuilder
    implements Builder<CreateGameRating, CreateGameRatingBuilder> {
  _$CreateGameRating? _$v;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  CreateGameRatingBuilder() {
    CreateGameRating._defaults(this);
  }

  CreateGameRatingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rating = $v.rating;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateGameRating other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateGameRating;
  }

  @override
  void update(void Function(CreateGameRatingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateGameRating build() => _build();

  _$CreateGameRating _build() {
    final _$result =
        _$v ?? new _$CreateGameRating._(rating: rating, content: content);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
