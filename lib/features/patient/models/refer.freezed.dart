// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Refer _$ReferFromJson(Map<String, dynamic> json) {
  return _Refer.fromJson(json);
}

/// @nodoc
mixin _$Refer {
  num get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_no')
  String get serialNo => throw _privateConstructorUsedError;
  Patientzzzz get patient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferCopyWith<Refer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferCopyWith<$Res> {
  factory $ReferCopyWith(Refer value, $Res Function(Refer) then) =
      _$ReferCopyWithImpl<$Res, Refer>;
  @useResult
  $Res call(
      {num id,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'serial_no') String serialNo,
      Patientzzzz patient});

  $PatientzzzzCopyWith<$Res> get patient;
}

/// @nodoc
class _$ReferCopyWithImpl<$Res, $Val extends Refer>
    implements $ReferCopyWith<$Res> {
  _$ReferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? serialNo = null,
    Object? patient = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serialNo: null == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patientzzzz,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientzzzzCopyWith<$Res> get patient {
    return $PatientzzzzCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferImplCopyWith<$Res> implements $ReferCopyWith<$Res> {
  factory _$$ReferImplCopyWith(
          _$ReferImpl value, $Res Function(_$ReferImpl) then) =
      __$$ReferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num id,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'serial_no') String serialNo,
      Patientzzzz patient});

  @override
  $PatientzzzzCopyWith<$Res> get patient;
}

/// @nodoc
class __$$ReferImplCopyWithImpl<$Res>
    extends _$ReferCopyWithImpl<$Res, _$ReferImpl>
    implements _$$ReferImplCopyWith<$Res> {
  __$$ReferImplCopyWithImpl(
      _$ReferImpl _value, $Res Function(_$ReferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? serialNo = null,
    Object? patient = null,
  }) {
    return _then(_$ReferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serialNo: null == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patientzzzz,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferImpl implements _Refer {
  const _$ReferImpl(
      {required this.id,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'serial_no') required this.serialNo,
      required this.patient});

  factory _$ReferImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferImplFromJson(json);

  @override
  final num id;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'serial_no')
  final String serialNo;
  @override
  final Patientzzzz patient;

  @override
  String toString() {
    return 'Refer(id: $id, updatedAt: $updatedAt, serialNo: $serialNo, patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.serialNo, serialNo) ||
                other.serialNo == serialNo) &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, updatedAt, serialNo, patient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferImplCopyWith<_$ReferImpl> get copyWith =>
      __$$ReferImplCopyWithImpl<_$ReferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferImplToJson(
      this,
    );
  }
}

abstract class _Refer implements Refer {
  const factory _Refer(
      {required final num id,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'serial_no') required final String serialNo,
      required final Patientzzzz patient}) = _$ReferImpl;

  factory _Refer.fromJson(Map<String, dynamic> json) = _$ReferImpl.fromJson;

  @override
  num get id;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'serial_no')
  String get serialNo;
  @override
  Patientzzzz get patient;
  @override
  @JsonKey(ignore: true)
  _$$ReferImplCopyWith<_$ReferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Patientzzzz _$PatientzzzzFromJson(Map<String, dynamic> json) {
  return _Patientzzzz.fromJson(json);
}

/// @nodoc
mixin _$Patientzzzz {
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientzzzzCopyWith<Patientzzzz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientzzzzCopyWith<$Res> {
  factory $PatientzzzzCopyWith(
          Patientzzzz value, $Res Function(Patientzzzz) then) =
      _$PatientzzzzCopyWithImpl<$Res, Patientzzzz>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName});
}

/// @nodoc
class _$PatientzzzzCopyWithImpl<$Res, $Val extends Patientzzzz>
    implements $PatientzzzzCopyWith<$Res> {
  _$PatientzzzzCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientzzzzImplCopyWith<$Res>
    implements $PatientzzzzCopyWith<$Res> {
  factory _$$PatientzzzzImplCopyWith(
          _$PatientzzzzImpl value, $Res Function(_$PatientzzzzImpl) then) =
      __$$PatientzzzzImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName});
}

/// @nodoc
class __$$PatientzzzzImplCopyWithImpl<$Res>
    extends _$PatientzzzzCopyWithImpl<$Res, _$PatientzzzzImpl>
    implements _$$PatientzzzzImplCopyWith<$Res> {
  __$$PatientzzzzImplCopyWithImpl(
      _$PatientzzzzImpl _value, $Res Function(_$PatientzzzzImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$PatientzzzzImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientzzzzImpl implements _Patientzzzz {
  const _$PatientzzzzImpl(
      {@JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName});

  factory _$PatientzzzzImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientzzzzImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;

  @override
  String toString() {
    return 'Patientzzzz(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientzzzzImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientzzzzImplCopyWith<_$PatientzzzzImpl> get copyWith =>
      __$$PatientzzzzImplCopyWithImpl<_$PatientzzzzImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientzzzzImplToJson(
      this,
    );
  }
}

abstract class _Patientzzzz implements Patientzzzz {
  const factory _Patientzzzz(
          {@JsonKey(name: 'first_name') required final String firstName,
          @JsonKey(name: 'last_name') required final String lastName}) =
      _$PatientzzzzImpl;

  factory _Patientzzzz.fromJson(Map<String, dynamic> json) =
      _$PatientzzzzImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$$PatientzzzzImplCopyWith<_$PatientzzzzImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
