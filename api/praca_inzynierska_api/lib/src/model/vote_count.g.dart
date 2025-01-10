// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_count.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoteCount extends VoteCount {
  @override
  final int? downvotes;
  @override
  final int? upvotes;

  factory _$VoteCount([void Function(VoteCountBuilder)? updates]) =>
      (new VoteCountBuilder()..update(updates))._build();

  _$VoteCount._({this.downvotes, this.upvotes}) : super._();

  @override
  VoteCount rebuild(void Function(VoteCountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoteCountBuilder toBuilder() => new VoteCountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoteCount &&
        downvotes == other.downvotes &&
        upvotes == other.upvotes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, downvotes.hashCode);
    _$hash = $jc(_$hash, upvotes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VoteCount')
          ..add('downvotes', downvotes)
          ..add('upvotes', upvotes))
        .toString();
  }
}

class VoteCountBuilder implements Builder<VoteCount, VoteCountBuilder> {
  _$VoteCount? _$v;

  int? _downvotes;
  int? get downvotes => _$this._downvotes;
  set downvotes(int? downvotes) => _$this._downvotes = downvotes;

  int? _upvotes;
  int? get upvotes => _$this._upvotes;
  set upvotes(int? upvotes) => _$this._upvotes = upvotes;

  VoteCountBuilder() {
    VoteCount._defaults(this);
  }

  VoteCountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _downvotes = $v.downvotes;
      _upvotes = $v.upvotes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoteCount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VoteCount;
  }

  @override
  void update(void Function(VoteCountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VoteCount build() => _build();

  _$VoteCount _build() {
    final _$result =
        _$v ?? new _$VoteCount._(downvotes: downvotes, upvotes: upvotes);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
