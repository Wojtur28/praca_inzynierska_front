// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_game_search_with_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SteamGameSearchWithDetails extends SteamGameSearchWithDetails {
  @override
  final int? requiredAge;
  @override
  final String? supportedLanguages;
  @override
  final String? headerImage;
  @override
  final BuiltList<Genre>? genres;
  @override
  final String? publisher;
  @override
  final String? developer;
  @override
  final String? capsuleImage;
  @override
  final BuiltList<Category>? categories;
  @override
  final BuiltList<Platform>? platforms;
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

  factory _$SteamGameSearchWithDetails(
          [void Function(SteamGameSearchWithDetailsBuilder)? updates]) =>
      (new SteamGameSearchWithDetailsBuilder()..update(updates))._build();

  _$SteamGameSearchWithDetails._(
      {this.requiredAge,
      this.supportedLanguages,
      this.headerImage,
      this.genres,
      this.publisher,
      this.developer,
      this.capsuleImage,
      this.categories,
      this.platforms,
      this.id,
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
  SteamGameSearchWithDetails rebuild(
          void Function(SteamGameSearchWithDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SteamGameSearchWithDetailsBuilder toBuilder() =>
      new SteamGameSearchWithDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SteamGameSearchWithDetails &&
        requiredAge == other.requiredAge &&
        supportedLanguages == other.supportedLanguages &&
        headerImage == other.headerImage &&
        genres == other.genres &&
        publisher == other.publisher &&
        developer == other.developer &&
        capsuleImage == other.capsuleImage &&
        categories == other.categories &&
        platforms == other.platforms &&
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
    _$hash = $jc(_$hash, requiredAge.hashCode);
    _$hash = $jc(_$hash, supportedLanguages.hashCode);
    _$hash = $jc(_$hash, headerImage.hashCode);
    _$hash = $jc(_$hash, genres.hashCode);
    _$hash = $jc(_$hash, publisher.hashCode);
    _$hash = $jc(_$hash, developer.hashCode);
    _$hash = $jc(_$hash, capsuleImage.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, platforms.hashCode);
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
    return (newBuiltValueToStringHelper(r'SteamGameSearchWithDetails')
          ..add('requiredAge', requiredAge)
          ..add('supportedLanguages', supportedLanguages)
          ..add('headerImage', headerImage)
          ..add('genres', genres)
          ..add('publisher', publisher)
          ..add('developer', developer)
          ..add('capsuleImage', capsuleImage)
          ..add('categories', categories)
          ..add('platforms', platforms)
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

class SteamGameSearchWithDetailsBuilder
    implements
        Builder<SteamGameSearchWithDetails, SteamGameSearchWithDetailsBuilder>,
        SteamGameBuilder {
  _$SteamGameSearchWithDetails? _$v;

  int? _requiredAge;
  int? get requiredAge => _$this._requiredAge;
  set requiredAge(covariant int? requiredAge) =>
      _$this._requiredAge = requiredAge;

  String? _supportedLanguages;
  String? get supportedLanguages => _$this._supportedLanguages;
  set supportedLanguages(covariant String? supportedLanguages) =>
      _$this._supportedLanguages = supportedLanguages;

  String? _headerImage;
  String? get headerImage => _$this._headerImage;
  set headerImage(covariant String? headerImage) =>
      _$this._headerImage = headerImage;

  ListBuilder<Genre>? _genres;
  ListBuilder<Genre> get genres => _$this._genres ??= new ListBuilder<Genre>();
  set genres(covariant ListBuilder<Genre>? genres) => _$this._genres = genres;

  String? _publisher;
  String? get publisher => _$this._publisher;
  set publisher(covariant String? publisher) => _$this._publisher = publisher;

  String? _developer;
  String? get developer => _$this._developer;
  set developer(covariant String? developer) => _$this._developer = developer;

  String? _capsuleImage;
  String? get capsuleImage => _$this._capsuleImage;
  set capsuleImage(covariant String? capsuleImage) =>
      _$this._capsuleImage = capsuleImage;

  ListBuilder<Category>? _categories;
  ListBuilder<Category> get categories =>
      _$this._categories ??= new ListBuilder<Category>();
  set categories(covariant ListBuilder<Category>? categories) =>
      _$this._categories = categories;

  ListBuilder<Platform>? _platforms;
  ListBuilder<Platform> get platforms =>
      _$this._platforms ??= new ListBuilder<Platform>();
  set platforms(covariant ListBuilder<Platform>? platforms) =>
      _$this._platforms = platforms;

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

  SteamGameSearchWithDetailsBuilder() {
    SteamGameSearchWithDetails._defaults(this);
  }

  SteamGameSearchWithDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _requiredAge = $v.requiredAge;
      _supportedLanguages = $v.supportedLanguages;
      _headerImage = $v.headerImage;
      _genres = $v.genres?.toBuilder();
      _publisher = $v.publisher;
      _developer = $v.developer;
      _capsuleImage = $v.capsuleImage;
      _categories = $v.categories?.toBuilder();
      _platforms = $v.platforms?.toBuilder();
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
  void replace(covariant SteamGameSearchWithDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SteamGameSearchWithDetails;
  }

  @override
  void update(void Function(SteamGameSearchWithDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SteamGameSearchWithDetails build() => _build();

  _$SteamGameSearchWithDetails _build() {
    _$SteamGameSearchWithDetails _$result;
    try {
      _$result = _$v ??
          new _$SteamGameSearchWithDetails._(
              requiredAge: requiredAge,
              supportedLanguages: supportedLanguages,
              headerImage: headerImage,
              genres: _genres?.build(),
              publisher: publisher,
              developer: developer,
              capsuleImage: capsuleImage,
              categories: _categories?.build(),
              platforms: _platforms?.build(),
              id: id,
              appId: appId,
              title: title,
              reviewsTotal: reviewsTotal,
              reviewsScoreFancy: reviewsScoreFancy,
              releaseDate: releaseDate,
              launchPrice: launchPrice,
              tags: tags,
              steamPage: steamPage);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genres';
        _genres?.build();

        _$failedField = 'categories';
        _categories?.build();
        _$failedField = 'platforms';
        _platforms?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SteamGameSearchWithDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
