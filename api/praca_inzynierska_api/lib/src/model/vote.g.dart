// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Vote extends Vote {
  @override
  final String? voteType;

  factory _$Vote([void Function(VoteBuilder)? updates]) =>
      (new VoteBuilder()..update(updates))._build();

  _$Vote._({this.voteType}) : super._();

  @override
  Vote rebuild(void Function(VoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoteBuilder toBuilder() => new VoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Vote && voteType == other.voteType;
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
    return (newBuiltValueToStringHelper(r'Vote')..add('voteType', voteType))
        .toString();
  }
}

class VoteBuilder implements Builder<Vote, VoteBuilder> {
  _$Vote? _$v;

  String? _voteType;
  String? get voteType => _$this._voteType;
  set voteType(String? voteType) => _$this._voteType = voteType;

  VoteBuilder() {
    Vote._defaults(this);
  }

  VoteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _voteType = $v.voteType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Vote other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Vote;
  }

  @override
  void update(void Function(VoteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Vote build() => _build();

  _$Vote _build() {
    final _$result = _$v ?? new _$Vote._(voteType: voteType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
