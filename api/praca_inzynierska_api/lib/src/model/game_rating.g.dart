// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_rating.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GameRating extends GameRating {
  @override
  final String? id;
  @override
  final SteamGame? steamGame;
  @override
  final User? user;
  @override
  final int? rating;
  @override
  final String? content;
  @override
  final int? votesUp;
  @override
  final int? votesDown;
  @override
  final DateTime? createdAt;

  factory _$GameRating([void Function(GameRatingBuilder)? updates]) =>
      (new GameRatingBuilder()..update(updates))._build();

  _$GameRating._(
      {this.id,
      this.steamGame,
      this.user,
      this.rating,
      this.content,
      this.votesUp,
      this.votesDown,
      this.createdAt})
      : super._();

  @override
  GameRating rebuild(void Function(GameRatingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameRatingBuilder toBuilder() => new GameRatingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameRating &&
        id == other.id &&
        steamGame == other.steamGame &&
        user == other.user &&
        rating == other.rating &&
        content == other.content &&
        votesUp == other.votesUp &&
        votesDown == other.votesDown &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, steamGame.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, votesUp.hashCode);
    _$hash = $jc(_$hash, votesDown.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GameRating')
          ..add('id', id)
          ..add('steamGame', steamGame)
          ..add('user', user)
          ..add('rating', rating)
          ..add('content', content)
          ..add('votesUp', votesUp)
          ..add('votesDown', votesDown)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GameRatingBuilder implements Builder<GameRating, GameRatingBuilder> {
  _$GameRating? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  SteamGame? _steamGame;
  SteamGame? get steamGame => _$this._steamGame;
  set steamGame(SteamGame? steamGame) => _$this._steamGame = steamGame;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _votesUp;
  int? get votesUp => _$this._votesUp;
  set votesUp(int? votesUp) => _$this._votesUp = votesUp;

  int? _votesDown;
  int? get votesDown => _$this._votesDown;
  set votesDown(int? votesDown) => _$this._votesDown = votesDown;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  GameRatingBuilder() {
    GameRating._defaults(this);
  }

  GameRatingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _steamGame = $v.steamGame;
      _user = $v.user?.toBuilder();
      _rating = $v.rating;
      _content = $v.content;
      _votesUp = $v.votesUp;
      _votesDown = $v.votesDown;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameRating other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameRating;
  }

  @override
  void update(void Function(GameRatingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GameRating build() => _build();

  _$GameRating _build() {
    _$GameRating _$result;
    try {
      _$result = _$v ??
          new _$GameRating._(
              id: id,
              steamGame: steamGame,
              user: _user?.build(),
              rating: rating,
              content: content,
              votesUp: votesUp,
              votesDown: votesDown,
              createdAt: createdAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GameRating', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
