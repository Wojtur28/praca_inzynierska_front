// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateUser extends UpdateUser {
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? gender;

  factory _$UpdateUser([void Function(UpdateUserBuilder)? updates]) =>
      (new UpdateUserBuilder()..update(updates))._build();

  _$UpdateUser._({this.firstName, this.lastName, this.gender}) : super._();

  @override
  UpdateUser rebuild(void Function(UpdateUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateUserBuilder toBuilder() => new UpdateUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateUser &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        gender == other.gender;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateUser')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('gender', gender))
        .toString();
  }
}

class UpdateUserBuilder implements Builder<UpdateUser, UpdateUserBuilder> {
  _$UpdateUser? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  UpdateUserBuilder() {
    UpdateUser._defaults(this);
  }

  UpdateUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _gender = $v.gender;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateUser;
  }

  @override
  void update(void Function(UpdateUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateUser build() => _build();

  _$UpdateUser _build() {
    final _$result = _$v ??
        new _$UpdateUser._(
            firstName: firstName, lastName: lastName, gender: gender);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
