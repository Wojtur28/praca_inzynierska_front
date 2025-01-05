// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_game_rating_answer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateGameRatingAnswer extends CreateGameRatingAnswer {
  @override
  final String? content;

  factory _$CreateGameRatingAnswer(
          [void Function(CreateGameRatingAnswerBuilder)? updates]) =>
      (new CreateGameRatingAnswerBuilder()..update(updates))._build();

  _$CreateGameRatingAnswer._({this.content}) : super._();

  @override
  CreateGameRatingAnswer rebuild(
          void Function(CreateGameRatingAnswerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateGameRatingAnswerBuilder toBuilder() =>
      new CreateGameRatingAnswerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateGameRatingAnswer && content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateGameRatingAnswer')
          ..add('content', content))
        .toString();
  }
}

class CreateGameRatingAnswerBuilder
    implements Builder<CreateGameRatingAnswer, CreateGameRatingAnswerBuilder> {
  _$CreateGameRatingAnswer? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  CreateGameRatingAnswerBuilder() {
    CreateGameRatingAnswer._defaults(this);
  }

  CreateGameRatingAnswerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateGameRatingAnswer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateGameRatingAnswer;
  }

  @override
  void update(void Function(CreateGameRatingAnswerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateGameRatingAnswer build() => _build();

  _$CreateGameRatingAnswer _build() {
    final _$result = _$v ?? new _$CreateGameRatingAnswer._(content: content);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
