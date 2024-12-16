// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_review.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SteamReview extends SteamReview {
  @override
  final String? id;
  @override
  final String? reviewId;
  @override
  final String? userSteamId;
  @override
  final String? content;
  @override
  final int? score;
  @override
  final DateTime? timestampCreated;
  @override
  final int? votesUp;
  @override
  final int? votesDown;

  factory _$SteamReview([void Function(SteamReviewBuilder)? updates]) =>
      (new SteamReviewBuilder()..update(updates))._build();

  _$SteamReview._(
      {this.id,
      this.reviewId,
      this.userSteamId,
      this.content,
      this.score,
      this.timestampCreated,
      this.votesUp,
      this.votesDown})
      : super._();

  @override
  SteamReview rebuild(void Function(SteamReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SteamReviewBuilder toBuilder() => new SteamReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SteamReview &&
        id == other.id &&
        reviewId == other.reviewId &&
        userSteamId == other.userSteamId &&
        content == other.content &&
        score == other.score &&
        timestampCreated == other.timestampCreated &&
        votesUp == other.votesUp &&
        votesDown == other.votesDown;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, reviewId.hashCode);
    _$hash = $jc(_$hash, userSteamId.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, timestampCreated.hashCode);
    _$hash = $jc(_$hash, votesUp.hashCode);
    _$hash = $jc(_$hash, votesDown.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SteamReview')
          ..add('id', id)
          ..add('reviewId', reviewId)
          ..add('userSteamId', userSteamId)
          ..add('content', content)
          ..add('score', score)
          ..add('timestampCreated', timestampCreated)
          ..add('votesUp', votesUp)
          ..add('votesDown', votesDown))
        .toString();
  }
}

class SteamReviewBuilder implements Builder<SteamReview, SteamReviewBuilder> {
  _$SteamReview? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _reviewId;
  String? get reviewId => _$this._reviewId;
  set reviewId(String? reviewId) => _$this._reviewId = reviewId;

  String? _userSteamId;
  String? get userSteamId => _$this._userSteamId;
  set userSteamId(String? userSteamId) => _$this._userSteamId = userSteamId;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _score;
  int? get score => _$this._score;
  set score(int? score) => _$this._score = score;

  DateTime? _timestampCreated;
  DateTime? get timestampCreated => _$this._timestampCreated;
  set timestampCreated(DateTime? timestampCreated) =>
      _$this._timestampCreated = timestampCreated;

  int? _votesUp;
  int? get votesUp => _$this._votesUp;
  set votesUp(int? votesUp) => _$this._votesUp = votesUp;

  int? _votesDown;
  int? get votesDown => _$this._votesDown;
  set votesDown(int? votesDown) => _$this._votesDown = votesDown;

  SteamReviewBuilder() {
    SteamReview._defaults(this);
  }

  SteamReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _reviewId = $v.reviewId;
      _userSteamId = $v.userSteamId;
      _content = $v.content;
      _score = $v.score;
      _timestampCreated = $v.timestampCreated;
      _votesUp = $v.votesUp;
      _votesDown = $v.votesDown;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SteamReview other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SteamReview;
  }

  @override
  void update(void Function(SteamReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SteamReview build() => _build();

  _$SteamReview _build() {
    final _$result = _$v ??
        new _$SteamReview._(
            id: id,
            reviewId: reviewId,
            userSteamId: userSteamId,
            content: content,
            score: score,
            timestampCreated: timestampCreated,
            votesUp: votesUp,
            votesDown: votesDown);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
