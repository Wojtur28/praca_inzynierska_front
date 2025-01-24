// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LibraryItemGameStatusEnum _$libraryItemGameStatusEnum_NOT_STARTED =
    const LibraryItemGameStatusEnum._('NOT_STARTED');
const LibraryItemGameStatusEnum _$libraryItemGameStatusEnum_IN_PROGRESS =
    const LibraryItemGameStatusEnum._('IN_PROGRESS');
const LibraryItemGameStatusEnum _$libraryItemGameStatusEnum_COMPLETED =
    const LibraryItemGameStatusEnum._('COMPLETED');
const LibraryItemGameStatusEnum _$libraryItemGameStatusEnum_DROPPED =
    const LibraryItemGameStatusEnum._('DROPPED');

LibraryItemGameStatusEnum _$libraryItemGameStatusEnumValueOf(String name) {
  switch (name) {
    case 'NOT_STARTED':
      return _$libraryItemGameStatusEnum_NOT_STARTED;
    case 'IN_PROGRESS':
      return _$libraryItemGameStatusEnum_IN_PROGRESS;
    case 'COMPLETED':
      return _$libraryItemGameStatusEnum_COMPLETED;
    case 'DROPPED':
      return _$libraryItemGameStatusEnum_DROPPED;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<LibraryItemGameStatusEnum> _$libraryItemGameStatusEnumValues =
    new BuiltSet<LibraryItemGameStatusEnum>(const <LibraryItemGameStatusEnum>[
  _$libraryItemGameStatusEnum_NOT_STARTED,
  _$libraryItemGameStatusEnum_IN_PROGRESS,
  _$libraryItemGameStatusEnum_COMPLETED,
  _$libraryItemGameStatusEnum_DROPPED,
]);

Serializer<LibraryItemGameStatusEnum> _$libraryItemGameStatusEnumSerializer =
    new _$LibraryItemGameStatusEnumSerializer();

class _$LibraryItemGameStatusEnumSerializer
    implements PrimitiveSerializer<LibraryItemGameStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'NOT_STARTED': 'NOT_STARTED',
    'IN_PROGRESS': 'IN_PROGRESS',
    'COMPLETED': 'COMPLETED',
    'DROPPED': 'DROPPED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'NOT_STARTED': 'NOT_STARTED',
    'IN_PROGRESS': 'IN_PROGRESS',
    'COMPLETED': 'COMPLETED',
    'DROPPED': 'DROPPED',
  };

  @override
  final Iterable<Type> types = const <Type>[LibraryItemGameStatusEnum];
  @override
  final String wireName = 'LibraryItemGameStatusEnum';

  @override
  Object serialize(Serializers serializers, LibraryItemGameStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LibraryItemGameStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LibraryItemGameStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$LibraryItem extends LibraryItem {
  @override
  final String? id;
  @override
  final SteamGame? steamGame;
  @override
  final LibraryItemGameStatusEnum? gameStatus;

  factory _$LibraryItem([void Function(LibraryItemBuilder)? updates]) =>
      (new LibraryItemBuilder()..update(updates))._build();

  _$LibraryItem._({this.id, this.steamGame, this.gameStatus}) : super._();

  @override
  LibraryItem rebuild(void Function(LibraryItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LibraryItemBuilder toBuilder() => new LibraryItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LibraryItem &&
        id == other.id &&
        steamGame == other.steamGame &&
        gameStatus == other.gameStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, steamGame.hashCode);
    _$hash = $jc(_$hash, gameStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LibraryItem')
          ..add('id', id)
          ..add('steamGame', steamGame)
          ..add('gameStatus', gameStatus))
        .toString();
  }
}

class LibraryItemBuilder implements Builder<LibraryItem, LibraryItemBuilder> {
  _$LibraryItem? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  SteamGame? _steamGame;
  SteamGame? get steamGame => _$this._steamGame;
  set steamGame(SteamGame? steamGame) => _$this._steamGame = steamGame;

  LibraryItemGameStatusEnum? _gameStatus;
  LibraryItemGameStatusEnum? get gameStatus => _$this._gameStatus;
  set gameStatus(LibraryItemGameStatusEnum? gameStatus) =>
      _$this._gameStatus = gameStatus;

  LibraryItemBuilder() {
    LibraryItem._defaults(this);
  }

  LibraryItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _steamGame = $v.steamGame;
      _gameStatus = $v.gameStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LibraryItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LibraryItem;
  }

  @override
  void update(void Function(LibraryItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LibraryItem build() => _build();

  _$LibraryItem _build() {
    final _$result = _$v ??
        new _$LibraryItem._(
            id: id, steamGame: steamGame, gameStatus: gameStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
