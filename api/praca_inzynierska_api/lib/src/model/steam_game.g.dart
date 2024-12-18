// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_game.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class SteamGameBuilder {
  void replace(SteamGame other);
  void update(void Function(SteamGameBuilder) updates);
  String? get id;
  set id(String? id);

  int? get appId;
  set appId(int? appId);

  String? get title;
  set title(String? title);

  int? get reviewsTotal;
  set reviewsTotal(int? reviewsTotal);

  String? get reviewsScoreFancy;
  set reviewsScoreFancy(String? reviewsScoreFancy);

  Date? get releaseDate;
  set releaseDate(Date? releaseDate);

  String? get launchPrice;
  set launchPrice(String? launchPrice);

  String? get tags;
  set tags(String? tags);

  String? get steamPage;
  set steamPage(String? steamPage);
}

class _$$SteamGame extends $SteamGame {
  @override
  final String? id;
  @override
  final int? appId;
  @override
  final String? title;
  @override
  final int? reviewsTotal;
  @override
  final String? reviewsScoreFancy;
  @override
  final Date? releaseDate;
  @override
  final String? launchPrice;
  @override
  final String? tags;
  @override
  final String? steamPage;

  factory _$$SteamGame([void Function($SteamGameBuilder)? updates]) =>
      (new $SteamGameBuilder()..update(updates))._build();

  _$$SteamGame._(
      {this.id,
      this.appId,
      this.title,
      this.reviewsTotal,
      this.reviewsScoreFancy,
      this.releaseDate,
      this.launchPrice,
      this.tags,
      this.steamPage})
      : super._();

  @override
  $SteamGame rebuild(void Function($SteamGameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $SteamGameBuilder toBuilder() => new $SteamGameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $SteamGame &&
        id == other.id &&
        appId == other.appId &&
        title == other.title &&
        reviewsTotal == other.reviewsTotal &&
        reviewsScoreFancy == other.reviewsScoreFancy &&
        releaseDate == other.releaseDate &&
        launchPrice == other.launchPrice &&
        tags == other.tags &&
        steamPage == other.steamPage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, appId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, reviewsTotal.hashCode);
    _$hash = $jc(_$hash, reviewsScoreFancy.hashCode);
    _$hash = $jc(_$hash, releaseDate.hashCode);
    _$hash = $jc(_$hash, launchPrice.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, steamPage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$SteamGame')
          ..add('id', id)
          ..add('appId', appId)
          ..add('title', title)
          ..add('reviewsTotal', reviewsTotal)
          ..add('reviewsScoreFancy', reviewsScoreFancy)
          ..add('releaseDate', releaseDate)
          ..add('launchPrice', launchPrice)
          ..add('tags', tags)
          ..add('steamPage', steamPage))
        .toString();
  }
}

class $SteamGameBuilder
    implements Builder<$SteamGame, $SteamGameBuilder>, SteamGameBuilder {
  _$$SteamGame? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  int? _appId;
  int? get appId => _$this._appId;
  set appId(covariant int? appId) => _$this._appId = appId;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  int? _reviewsTotal;
  int? get reviewsTotal => _$this._reviewsTotal;
  set reviewsTotal(covariant int? reviewsTotal) =>
      _$this._reviewsTotal = reviewsTotal;

  String? _reviewsScoreFancy;
  String? get reviewsScoreFancy => _$this._reviewsScoreFancy;
  set reviewsScoreFancy(covariant String? reviewsScoreFancy) =>
      _$this._reviewsScoreFancy = reviewsScoreFancy;

  Date? _releaseDate;
  Date? get releaseDate => _$this._releaseDate;
  set releaseDate(covariant Date? releaseDate) =>
      _$this._releaseDate = releaseDate;

  String? _launchPrice;
  String? get launchPrice => _$this._launchPrice;
  set launchPrice(covariant String? launchPrice) =>
      _$this._launchPrice = launchPrice;

  String? _tags;
  String? get tags => _$this._tags;
  set tags(covariant String? tags) => _$this._tags = tags;

  String? _steamPage;
  String? get steamPage => _$this._steamPage;
  set steamPage(covariant String? steamPage) => _$this._steamPage = steamPage;

  $SteamGameBuilder() {
    $SteamGame._defaults(this);
  }

  $SteamGameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _appId = $v.appId;
      _title = $v.title;
      _reviewsTotal = $v.reviewsTotal;
      _reviewsScoreFancy = $v.reviewsScoreFancy;
      _releaseDate = $v.releaseDate;
      _launchPrice = $v.launchPrice;
      _tags = $v.tags;
      _steamPage = $v.steamPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $SteamGame other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$SteamGame;
  }

  @override
  void update(void Function($SteamGameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $SteamGame build() => _build();

  _$$SteamGame _build() {
    final _$result = _$v ??
        new _$$SteamGame._(
            id: id,
            appId: appId,
            title: title,
            reviewsTotal: reviewsTotal,
            reviewsScoreFancy: reviewsScoreFancy,
            releaseDate: releaseDate,
            launchPrice: launchPrice,
            tags: tags,
            steamPage: steamPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
