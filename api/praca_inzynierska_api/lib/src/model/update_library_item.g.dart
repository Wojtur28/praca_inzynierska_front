// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_library_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpdateLibraryItemGameStatusEnum
    _$updateLibraryItemGameStatusEnum_NOT_STARTED =
    const UpdateLibraryItemGameStatusEnum._('NOT_STARTED');
const UpdateLibraryItemGameStatusEnum
    _$updateLibraryItemGameStatusEnum_IN_PROGRESS =
    const UpdateLibraryItemGameStatusEnum._('IN_PROGRESS');
const UpdateLibraryItemGameStatusEnum
    _$updateLibraryItemGameStatusEnum_COMPLETED =
    const UpdateLibraryItemGameStatusEnum._('COMPLETED');
const UpdateLibraryItemGameStatusEnum
    _$updateLibraryItemGameStatusEnum_DROPPED =
    const UpdateLibraryItemGameStatusEnum._('DROPPED');

UpdateLibraryItemGameStatusEnum _$updateLibraryItemGameStatusEnumValueOf(
    String name) {
  switch (name) {
    case 'NOT_STARTED':
      return _$updateLibraryItemGameStatusEnum_NOT_STARTED;
    case 'IN_PROGRESS':
      return _$updateLibraryItemGameStatusEnum_IN_PROGRESS;
    case 'COMPLETED':
      return _$updateLibraryItemGameStatusEnum_COMPLETED;
    case 'DROPPED':
      return _$updateLibraryItemGameStatusEnum_DROPPED;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UpdateLibraryItemGameStatusEnum>
    _$updateLibraryItemGameStatusEnumValues = new BuiltSet<
        UpdateLibraryItemGameStatusEnum>(const <UpdateLibraryItemGameStatusEnum>[
  _$updateLibraryItemGameStatusEnum_NOT_STARTED,
  _$updateLibraryItemGameStatusEnum_IN_PROGRESS,
  _$updateLibraryItemGameStatusEnum_COMPLETED,
  _$updateLibraryItemGameStatusEnum_DROPPED,
]);

Serializer<UpdateLibraryItemGameStatusEnum>
    _$updateLibraryItemGameStatusEnumSerializer =
    new _$UpdateLibraryItemGameStatusEnumSerializer();

class _$UpdateLibraryItemGameStatusEnumSerializer
    implements PrimitiveSerializer<UpdateLibraryItemGameStatusEnum> {
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
  final Iterable<Type> types = const <Type>[UpdateLibraryItemGameStatusEnum];
  @override
  final String wireName = 'UpdateLibraryItemGameStatusEnum';

  @override
  Object serialize(
          Serializers serializers, UpdateLibraryItemGameStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpdateLibraryItemGameStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpdateLibraryItemGameStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpdateLibraryItem extends UpdateLibraryItem {
  @override
  final UpdateLibraryItemGameStatusEnum? gameStatus;

  factory _$UpdateLibraryItem(
          [void Function(UpdateLibraryItemBuilder)? updates]) =>
      (new UpdateLibraryItemBuilder()..update(updates))._build();

  _$UpdateLibraryItem._({this.gameStatus}) : super._();

  @override
  UpdateLibraryItem rebuild(void Function(UpdateLibraryItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateLibraryItemBuilder toBuilder() =>
      new UpdateLibraryItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateLibraryItem && gameStatus == other.gameStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, gameStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateLibraryItem')
          ..add('gameStatus', gameStatus))
        .toString();
  }
}

class UpdateLibraryItemBuilder
    implements Builder<UpdateLibraryItem, UpdateLibraryItemBuilder> {
  _$UpdateLibraryItem? _$v;

  UpdateLibraryItemGameStatusEnum? _gameStatus;
  UpdateLibraryItemGameStatusEnum? get gameStatus => _$this._gameStatus;
  set gameStatus(UpdateLibraryItemGameStatusEnum? gameStatus) =>
      _$this._gameStatus = gameStatus;

  UpdateLibraryItemBuilder() {
    UpdateLibraryItem._defaults(this);
  }

  UpdateLibraryItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gameStatus = $v.gameStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateLibraryItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateLibraryItem;
  }

  @override
  void update(void Function(UpdateLibraryItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateLibraryItem build() => _build();

  _$UpdateLibraryItem _build() {
    final _$result = _$v ?? new _$UpdateLibraryItem._(gameStatus: gameStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
