// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_vital.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientVital _$PatientVitalFromJson(Map<String, dynamic> json) {
  return _PatientVital.fromJson(json);
}

/// @nodoc
mixin _$PatientVital {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_id')
  String get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vital_type')
  String get vitalType => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientVitalCopyWith<PatientVital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientVitalCopyWith<$Res> {
  factory $PatientVitalCopyWith(
          PatientVital value, $Res Function(PatientVital) then) =
      _$PatientVitalCopyWithImpl<$Res, PatientVital>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'patient_id') String patientId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'vital_type') String vitalType,
      String result,
      String remark,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$PatientVitalCopyWithImpl<$Res, $Val extends PatientVital>
    implements $PatientVitalCopyWith<$Res> {
  _$PatientVitalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? userId = null,
    Object? vitalType = null,
    Object? result = null,
    Object? remark = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      vitalType: null == vitalType
          ? _value.vitalType
          : vitalType // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientVitalImplCopyWith<$Res>
    implements $PatientVitalCopyWith<$Res> {
  factory _$$PatientVitalImplCopyWith(
          _$PatientVitalImpl value, $Res Function(_$PatientVitalImpl) then) =
      __$$PatientVitalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'patient_id') String patientId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'vital_type') String vitalType,
      String result,
      String remark,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$PatientVitalImplCopyWithImpl<$Res>
    extends _$PatientVitalCopyWithImpl<$Res, _$PatientVitalImpl>
    implements _$$PatientVitalImplCopyWith<$Res> {
  __$$PatientVitalImplCopyWithImpl(
      _$PatientVitalImpl _value, $Res Function(_$PatientVitalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? userId = null,
    Object? vitalType = null,
    Object? result = null,
    Object? remark = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PatientVitalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      vitalType: null == vitalType
          ? _value.vitalType
          : vitalType // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientVitalImpl implements _PatientVital {
  const _$PatientVitalImpl(
      {required this.id,
      @JsonKey(name: 'patient_id') required this.patientId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'vital_type') required this.vitalType,
      required this.result,
      required this.remark,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$PatientVitalImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientVitalImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'patient_id')
  final String patientId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'vital_type')
  final String vitalType;
  @override
  final String result;
  @override
  final String remark;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PatientVital(id: $id, patientId: $patientId, userId: $userId, vitalType: $vitalType, result: $result, remark: $remark, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientVitalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.vitalType, vitalType) ||
                other.vitalType == vitalType) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, patientId, userId, vitalType,
      result, remark, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientVitalImplCopyWith<_$PatientVitalImpl> get copyWith =>
      __$$PatientVitalImplCopyWithImpl<_$PatientVitalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientVitalImplToJson(
      this,
    );
  }
}

abstract class _PatientVital implements PatientVital {
  const factory _PatientVital(
          {required final int id,
          @JsonKey(name: 'patient_id') required final String patientId,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'vital_type') required final String vitalType,
          required final String result,
          required final String remark,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$PatientVitalImpl;

  factory _PatientVital.fromJson(Map<String, dynamic> json) =
      _$PatientVitalImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'patient_id')
  String get patientId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'vital_type')
  String get vitalType;
  @override
  String get result;
  @override
  String get remark;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PatientVitalImplCopyWith<_$PatientVitalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
