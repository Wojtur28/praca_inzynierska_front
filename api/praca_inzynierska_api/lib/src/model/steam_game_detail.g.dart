// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_game_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SteamGameDetail extends SteamGameDetail {
  @override
  final String? id;
  @override
  final String? headerImage;
  @override
  final String? capsuleImage;
  @override
  final String? website;
  @override
  final String? developer;
  @override
  final String? publisher;
  @override
  final int? requiredAge;
  @override
  final String? shortDescription;
  @override
  final String? supportedLanguages;
  @override
  final BuiltList<Category>? categories;
  @override
  final BuiltList<Genre>? genres;
  @override
  final BuiltList<Platform>? platforms;

  factory _$SteamGameDetail([void Function(SteamGameDetailBuilder)? updates]) =>
      (new SteamGameDetailBuilder()..update(updates))._build();

  _$SteamGameDetail._(
      {this.id,
      this.headerImage,
      this.capsuleImage,
      this.website,
      this.developer,
      this.publisher,
      this.requiredAge,
      this.shortDescription,
      this.supportedLanguages,
      this.categories,
      this.genres,
      this.platforms})
      : super._();

  @override
  SteamGameDetail rebuild(void Function(SteamGameDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SteamGameDetailBuilder toBuilder() =>
      new SteamGameDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SteamGameDetail &&
        id == other.id &&
        headerImage == other.headerImage &&
        capsuleImage == other.capsuleImage &&
        website == other.website &&
        developer == other.developer &&
        publisher == other.publisher &&
        requiredAge == other.requiredAge &&
        shortDescription == other.shortDescription &&
        supportedLanguages == other.supportedLanguages &&
        categories == other.categories &&
        genres == other.genres &&
        platforms == other.platforms;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, headerImage.hashCode);
    _$hash = $jc(_$hash, capsuleImage.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, developer.hashCode);
    _$hash = $jc(_$hash, publisher.hashCode);
    _$hash = $jc(_$hash, requiredAge.hashCode);
    _$hash = $jc(_$hash, shortDescription.hashCode);
    _$hash = $jc(_$hash, supportedLanguages.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, genres.hashCode);
    _$hash = $jc(_$hash, platforms.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SteamGameDetail')
          ..add('id', id)
          ..add('headerImage', headerImage)
          ..add('capsuleImage', capsuleImage)
          ..add('website', website)
          ..add('developer', developer)
          ..add('publisher', publisher)
          ..add('requiredAge', requiredAge)
          ..add('shortDescription', shortDescription)
          ..add('supportedLanguages', supportedLanguages)
          ..add('categories', categories)
          ..add('genres', genres)
          ..add('platforms', platforms))
        .toString();
  }
}

class SteamGameDetailBuilder
    implements Builder<SteamGameDetail, SteamGameDetailBuilder> {
  _$SteamGameDetail? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _headerImage;
  String? get headerImage => _$this._headerImage;
  set headerImage(String? headerImage) => _$this._headerImage = headerImage;

  String? _capsuleImage;
  String? get capsuleImage => _$this._capsuleImage;
  set capsuleImage(String? capsuleImage) => _$this._capsuleImage = capsuleImage;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _developer;
  String? get developer => _$this._developer;
  set developer(String? developer) => _$this._developer = developer;

  String? _publisher;
  String? get publisher => _$this._publisher;
  set publisher(String? publisher) => _$this._publisher = publisher;

  int? _requiredAge;
  int? get requiredAge => _$this._requiredAge;
  set requiredAge(int? requiredAge) => _$this._requiredAge = requiredAge;

  String? _shortDescription;
  String? get shortDescription => _$this._shortDescription;
  set shortDescription(String? shortDescription) =>
      _$this._shortDescription = shortDescription;

  String? _supportedLanguages;
  String? get supportedLanguages => _$this._supportedLanguages;
  set supportedLanguages(String? supportedLanguages) =>
      _$this._supportedLanguages = supportedLanguages;

  ListBuilder<Category>? _categories;
  ListBuilder<Category> get categories =>
      _$this._categories ??= new ListBuilder<Category>();
  set categories(ListBuilder<Category>? categories) =>
      _$this._categories = categories;

  ListBuilder<Genre>? _genres;
  ListBuilder<Genre> get genres => _$this._genres ??= new ListBuilder<Genre>();
  set genres(ListBuilder<Genre>? genres) => _$this._genres = genres;

  ListBuilder<Platform>? _platforms;
  ListBuilder<Platform> get platforms =>
      _$this._platforms ??= new ListBuilder<Platform>();
  set platforms(ListBuilder<Platform>? platforms) =>
      _$this._platforms = platforms;

  SteamGameDetailBuilder() {
    SteamGameDetail._defaults(this);
  }

  SteamGameDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _headerImage = $v.headerImage;
      _capsuleImage = $v.capsuleImage;
      _website = $v.website;
      _developer = $v.developer;
      _publisher = $v.publisher;
      _requiredAge = $v.requiredAge;
      _shortDescription = $v.shortDescription;
      _supportedLanguages = $v.supportedLanguages;
      _categories = $v.categories?.toBuilder();
      _genres = $v.genres?.toBuilder();
      _platforms = $v.platforms?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SteamGameDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SteamGameDetail;
  }

  @override
  void update(void Function(SteamGameDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SteamGameDetail build() => _build();

  _$SteamGameDetail _build() {
    _$SteamGameDetail _$result;
    try {
      _$result = _$v ??
          new _$SteamGameDetail._(
              id: id,
              headerImage: headerImage,
              capsuleImage: capsuleImage,
              website: website,
              developer: developer,
              publisher: publisher,
              requiredAge: requiredAge,
              shortDescription: shortDescription,
              supportedLanguages: supportedLanguages,
              categories: _categories?.build(),
              genres: _genres?.build(),
              platforms: _platforms?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();
        _$failedField = 'genres';
        _genres?.build();
        _$failedField = 'platforms';
        _platforms?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SteamGameDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
