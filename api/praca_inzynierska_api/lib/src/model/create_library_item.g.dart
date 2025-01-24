// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_library_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateLibraryItemGameStatusEnum
    _$createLibraryItemGameStatusEnum_NOT_STARTED =
    const CreateLibraryItemGameStatusEnum._('NOT_STARTED');
const CreateLibraryItemGameStatusEnum
    _$createLibraryItemGameStatusEnum_IN_PROGRESS =
    const CreateLibraryItemGameStatusEnum._('IN_PROGRESS');
const CreateLibraryItemGameStatusEnum
    _$createLibraryItemGameStatusEnum_COMPLETED =
    const CreateLibraryItemGameStatusEnum._('COMPLETED');
const CreateLibraryItemGameStatusEnum
    _$createLibraryItemGameStatusEnum_DROPPED =
    const CreateLibraryItemGameStatusEnum._('DROPPED');

CreateLibraryItemGameStatusEnum _$createLibraryItemGameStatusEnumValueOf(
    String name) {
  switch (name) {
    case 'NOT_STARTED':
      return _$createLibraryItemGameStatusEnum_NOT_STARTED;
    case 'IN_PROGRESS':
      return _$createLibraryItemGameStatusEnum_IN_PROGRESS;
    case 'COMPLETED':
      return _$createLibraryItemGameStatusEnum_COMPLETED;
    case 'DROPPED':
      return _$createLibraryItemGameStatusEnum_DROPPED;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CreateLibraryItemGameStatusEnum>
    _$createLibraryItemGameStatusEnumValues = new BuiltSet<
        CreateLibraryItemGameStatusEnum>(const <CreateLibraryItemGameStatusEnum>[
  _$createLibraryItemGameStatusEnum_NOT_STARTED,
  _$createLibraryItemGameStatusEnum_IN_PROGRESS,
  _$createLibraryItemGameStatusEnum_COMPLETED,
  _$createLibraryItemGameStatusEnum_DROPPED,
]);

Serializer<CreateLibraryItemGameStatusEnum>
    _$createLibraryItemGameStatusEnumSerializer =
    new _$CreateLibraryItemGameStatusEnumSerializer();

class _$CreateLibraryItemGameStatusEnumSerializer
    implements PrimitiveSerializer<CreateLibraryItemGameStatusEnum> {
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
  final Iterable<Type> types = const <Type>[CreateLibraryItemGameStatusEnum];
  @override
  final String wireName = 'CreateLibraryItemGameStatusEnum';

  @override
  Object serialize(
          Serializers serializers, CreateLibraryItemGameStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateLibraryItemGameStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateLibraryItemGameStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateLibraryItem extends CreateLibraryItem {
  @override
  final String? steamGameId;
  @override
  final CreateLibraryItemGameStatusEnum? gameStatus;

  factory _$CreateLibraryItem(
          [void Function(CreateLibraryItemBuilder)? updates]) =>
      (new CreateLibraryItemBuilder()..update(updates))._build();

  _$CreateLibraryItem._({this.steamGameId, this.gameStatus}) : super._();

  @override
  CreateLibraryItem rebuild(void Function(CreateLibraryItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateLibraryItemBuilder toBuilder() =>
      new CreateLibraryItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateLibraryItem &&
        steamGameId == other.steamGameId &&
        gameStatus == other.gameStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, steamGameId.hashCode);
    _$hash = $jc(_$hash, gameStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateLibraryItem')
          ..add('steamGameId', steamGameId)
          ..add('gameStatus', gameStatus))
        .toString();
  }
}

class CreateLibraryItemBuilder
    implements Builder<CreateLibraryItem, CreateLibraryItemBuilder> {
  _$CreateLibraryItem? _$v;

  String? _steamGameId;
  String? get steamGameId => _$this._steamGameId;
  set steamGameId(String? steamGameId) => _$this._steamGameId = steamGameId;

  CreateLibraryItemGameStatusEnum? _gameStatus;
  CreateLibraryItemGameStatusEnum? get gameStatus => _$this._gameStatus;
  set gameStatus(CreateLibraryItemGameStatusEnum? gameStatus) =>
      _$this._gameStatus = gameStatus;

  CreateLibraryItemBuilder() {
    CreateLibraryItem._defaults(this);
  }

  CreateLibraryItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _steamGameId = $v.steamGameId;
      _gameStatus = $v.gameStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateLibraryItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateLibraryItem;
  }

  @override
  void update(void Function(CreateLibraryItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateLibraryItem build() => _build();

  _$CreateLibraryItem _build() {
    final _$result = _$v ??
        new _$CreateLibraryItem._(
            steamGameId: steamGameId, gameStatus: gameStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
