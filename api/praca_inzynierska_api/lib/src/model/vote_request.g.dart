// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VoteRequestVoteTypeEnum _$voteRequestVoteTypeEnum_UP =
    const VoteRequestVoteTypeEnum._('UP');
const VoteRequestVoteTypeEnum _$voteRequestVoteTypeEnum_DOWN =
    const VoteRequestVoteTypeEnum._('DOWN');

VoteRequestVoteTypeEnum _$voteRequestVoteTypeEnumValueOf(String name) {
  switch (name) {
    case 'UP':
      return _$voteRequestVoteTypeEnum_UP;
    case 'DOWN':
      return _$voteRequestVoteTypeEnum_DOWN;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<VoteRequestVoteTypeEnum> _$voteRequestVoteTypeEnumValues =
    new BuiltSet<VoteRequestVoteTypeEnum>(const <VoteRequestVoteTypeEnum>[
  _$voteRequestVoteTypeEnum_UP,
  _$voteRequestVoteTypeEnum_DOWN,
]);

Serializer<VoteRequestVoteTypeEnum> _$voteRequestVoteTypeEnumSerializer =
    new _$VoteRequestVoteTypeEnumSerializer();

class _$VoteRequestVoteTypeEnumSerializer
    implements PrimitiveSerializer<VoteRequestVoteTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'UP': 'UP',
    'DOWN': 'DOWN',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'UP': 'UP',
    'DOWN': 'DOWN',
  };

  @override
  final Iterable<Type> types = const <Type>[VoteRequestVoteTypeEnum];
  @override
  final String wireName = 'VoteRequestVoteTypeEnum';

  @override
  Object serialize(Serializers serializers, VoteRequestVoteTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  VoteRequestVoteTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VoteRequestVoteTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$VoteRequest extends VoteRequest {
  @override
  final VoteRequestVoteTypeEnum? voteType;

  factory _$VoteRequest([void Function(VoteRequestBuilder)? updates]) =>
      (new VoteRequestBuilder()..update(updates))._build();

  _$VoteRequest._({this.voteType}) : super._();

  @override
  VoteRequest rebuild(void Function(VoteRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoteRequestBuilder toBuilder() => new VoteRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoteRequest && voteType == other.voteType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, voteType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VoteRequest')
          ..add('voteType', voteType))
        .toString();
  }
}

class VoteRequestBuilder implements Builder<VoteRequest, VoteRequestBuilder> {
  _$VoteRequest? _$v;

  VoteRequestVoteTypeEnum? _voteType;
  VoteRequestVoteTypeEnum? get voteType => _$this._voteType;
  set voteType(VoteRequestVoteTypeEnum? voteType) =>
      _$this._voteType = voteType;

  VoteRequestBuilder() {
    VoteRequest._defaults(this);
  }

  VoteRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _voteType = $v.voteType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoteRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VoteRequest;
  }

  @override
  void update(void Function(VoteRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VoteRequest build() => _build();

  _$VoteRequest _build() {
    final _$result = _$v ?? new _$VoteRequest._(voteType: voteType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
