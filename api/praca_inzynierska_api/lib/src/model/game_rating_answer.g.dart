// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_rating_answer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GameRatingAnswer extends GameRatingAnswer {
  @override
  final String? id;
  @override
  final GameRating? gameRating;
  @override
  final User? user;
  @override
  final String? content;
  @override
  final DateTime? createdAt;
  @override
  final String? createdBy;

  factory _$GameRatingAnswer(
          [void Function(GameRatingAnswerBuilder)? updates]) =>
      (new GameRatingAnswerBuilder()..update(updates))._build();

  _$GameRatingAnswer._(
      {this.id,
      this.gameRating,
      this.user,
      this.content,
      this.createdAt,
      this.createdBy})
      : super._();

  @override
  GameRatingAnswer rebuild(void Function(GameRatingAnswerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameRatingAnswerBuilder toBuilder() =>
      new GameRatingAnswerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameRatingAnswer &&
        id == other.id &&
        gameRating == other.gameRating &&
        user == other.user &&
        content == other.content &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, gameRating.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GameRatingAnswer')
          ..add('id', id)
          ..add('gameRating', gameRating)
          ..add('user', user)
          ..add('content', content)
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy))
        .toString();
  }
}

class GameRatingAnswerBuilder
    implements Builder<GameRatingAnswer, GameRatingAnswerBuilder> {
  _$GameRatingAnswer? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GameRatingBuilder? _gameRating;
  GameRatingBuilder get gameRating =>
      _$this._gameRating ??= new GameRatingBuilder();
  set gameRating(GameRatingBuilder? gameRating) =>
      _$this._gameRating = gameRating;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  GameRatingAnswerBuilder() {
    GameRatingAnswer._defaults(this);
  }

  GameRatingAnswerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _gameRating = $v.gameRating?.toBuilder();
      _user = $v.user?.toBuilder();
      _content = $v.content;
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameRatingAnswer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameRatingAnswer;
  }

  @override
  void update(void Function(GameRatingAnswerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GameRatingAnswer build() => _build();

  _$GameRatingAnswer _build() {
    _$GameRatingAnswer _$result;
    try {
      _$result = _$v ??
          new _$GameRatingAnswer._(
              id: id,
              gameRating: _gameRating?.build(),
              user: _user?.build(),
              content: content,
              createdAt: createdAt,
              createdBy: createdBy);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'gameRating';
        _gameRating?.build();
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GameRatingAnswer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
