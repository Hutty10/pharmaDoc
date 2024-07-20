// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientSummary _$PatientSummaryFromJson(Map<String, dynamic> json) {
  return _PatientSummary.fromJson(json);
}

/// @nodoc
mixin _$PatientSummary {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_no')
  String get serialNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'pharm_id', includeToJson: false)
  String get pharmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_id', includeToJson: false)
  String get docId => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_id', includeToJson: false)
  String get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pharm_note')
  String get pharmNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_note')
  String get docNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', includeToJson: false)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Patient get patient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientSummaryCopyWith<PatientSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientSummaryCopyWith<$Res> {
  factory $PatientSummaryCopyWith(
          PatientSummary value, $Res Function(PatientSummary) then) =
      _$PatientSummaryCopyWithImpl<$Res, PatientSummary>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'serial_no') String serialNo,
      @JsonKey(name: 'pharm_id', includeToJson: false) String pharmId,
      @JsonKey(name: 'doc_id', includeToJson: false) String docId,
      @JsonKey(name: 'patient_id', includeToJson: false) String patientId,
      @JsonKey(name: 'pharm_note') String pharmNote,
      @JsonKey(name: 'doc_note') String docNote,
      @JsonKey(name: 'created_at', includeToJson: false) DateTime createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false) DateTime updatedAt,
      Patient patient});

  $PatientCopyWith<$Res> get patient;
}

/// @nodoc
class _$PatientSummaryCopyWithImpl<$Res, $Val extends PatientSummary>
    implements $PatientSummaryCopyWith<$Res> {
  _$PatientSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serialNo = null,
    Object? pharmId = null,
    Object? docId = null,
    Object? patientId = null,
    Object? pharmNote = null,
    Object? docNote = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? patient = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      serialNo: null == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String,
      pharmId: null == pharmId
          ? _value.pharmId
          : pharmId // ignore: cast_nullable_to_non_nullable
              as String,
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      pharmNote: null == pharmNote
          ? _value.pharmNote
          : pharmNote // ignore: cast_nullable_to_non_nullable
              as String,
      docNote: null == docNote
          ? _value.docNote
          : docNote // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res> get patient {
    return $PatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientSummaryImplCopyWith<$Res>
    implements $PatientSummaryCopyWith<$Res> {
  factory _$$PatientSummaryImplCopyWith(_$PatientSummaryImpl value,
          $Res Function(_$PatientSummaryImpl) then) =
      __$$PatientSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'serial_no') String serialNo,
      @JsonKey(name: 'pharm_id', includeToJson: false) String pharmId,
      @JsonKey(name: 'doc_id', includeToJson: false) String docId,
      @JsonKey(name: 'patient_id', includeToJson: false) String patientId,
      @JsonKey(name: 'pharm_note') String pharmNote,
      @JsonKey(name: 'doc_note') String docNote,
      @JsonKey(name: 'created_at', includeToJson: false) DateTime createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false) DateTime updatedAt,
      Patient patient});

  @override
  $PatientCopyWith<$Res> get patient;
}

/// @nodoc
class __$$PatientSummaryImplCopyWithImpl<$Res>
    extends _$PatientSummaryCopyWithImpl<$Res, _$PatientSummaryImpl>
    implements _$$PatientSummaryImplCopyWith<$Res> {
  __$$PatientSummaryImplCopyWithImpl(
      _$PatientSummaryImpl _value, $Res Function(_$PatientSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serialNo = null,
    Object? pharmId = null,
    Object? docId = null,
    Object? patientId = null,
    Object? pharmNote = null,
    Object? docNote = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? patient = null,
  }) {
    return _then(_$PatientSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      serialNo: null == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String,
      pharmId: null == pharmId
          ? _value.pharmId
          : pharmId // ignore: cast_nullable_to_non_nullable
              as String,
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      pharmNote: null == pharmNote
          ? _value.pharmNote
          : pharmNote // ignore: cast_nullable_to_non_nullable
              as String,
      docNote: null == docNote
          ? _value.docNote
          : docNote // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientSummaryImpl implements _PatientSummary {
  const _$PatientSummaryImpl(
      {required this.id,
      @JsonKey(name: 'serial_no') required this.serialNo,
      @JsonKey(name: 'pharm_id', includeToJson: false) required this.pharmId,
      @JsonKey(name: 'doc_id', includeToJson: false) required this.docId,
      @JsonKey(name: 'patient_id', includeToJson: false)
      required this.patientId,
      @JsonKey(name: 'pharm_note') required this.pharmNote,
      @JsonKey(name: 'doc_note') required this.docNote,
      @JsonKey(name: 'created_at', includeToJson: false)
      required this.createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      required this.updatedAt,
      required this.patient});

  factory _$PatientSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientSummaryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'serial_no')
  final String serialNo;
  @override
  @JsonKey(name: 'pharm_id', includeToJson: false)
  final String pharmId;
  @override
  @JsonKey(name: 'doc_id', includeToJson: false)
  final String docId;
  @override
  @JsonKey(name: 'patient_id', includeToJson: false)
  final String patientId;
  @override
  @JsonKey(name: 'pharm_note')
  final String pharmNote;
  @override
  @JsonKey(name: 'doc_note')
  final String docNote;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', includeToJson: false)
  final DateTime updatedAt;
  @override
  final Patient patient;

  @override
  String toString() {
    return 'PatientSummary(id: $id, serialNo: $serialNo, pharmId: $pharmId, docId: $docId, patientId: $patientId, pharmNote: $pharmNote, docNote: $docNote, createdAt: $createdAt, updatedAt: $updatedAt, patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serialNo, serialNo) ||
                other.serialNo == serialNo) &&
            (identical(other.pharmId, pharmId) || other.pharmId == pharmId) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.pharmNote, pharmNote) ||
                other.pharmNote == pharmNote) &&
            (identical(other.docNote, docNote) || other.docNote == docNote) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, serialNo, pharmId, docId,
      patientId, pharmNote, docNote, createdAt, updatedAt, patient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientSummaryImplCopyWith<_$PatientSummaryImpl> get copyWith =>
      __$$PatientSummaryImplCopyWithImpl<_$PatientSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientSummaryImplToJson(
      this,
    );
  }
}

abstract class _PatientSummary implements PatientSummary {
  const factory _PatientSummary(
      {required final int id,
      @JsonKey(name: 'serial_no') required final String serialNo,
      @JsonKey(name: 'pharm_id', includeToJson: false)
      required final String pharmId,
      @JsonKey(name: 'doc_id', includeToJson: false)
      required final String docId,
      @JsonKey(name: 'patient_id', includeToJson: false)
      required final String patientId,
      @JsonKey(name: 'pharm_note') required final String pharmNote,
      @JsonKey(name: 'doc_note') required final String docNote,
      @JsonKey(name: 'created_at', includeToJson: false)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      required final DateTime updatedAt,
      required final Patient patient}) = _$PatientSummaryImpl;

  factory _PatientSummary.fromJson(Map<String, dynamic> json) =
      _$PatientSummaryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'serial_no')
  String get serialNo;
  @override
  @JsonKey(name: 'pharm_id', includeToJson: false)
  String get pharmId;
  @override
  @JsonKey(name: 'doc_id', includeToJson: false)
  String get docId;
  @override
  @JsonKey(name: 'patient_id', includeToJson: false)
  String get patientId;
  @override
  @JsonKey(name: 'pharm_note')
  String get pharmNote;
  @override
  @JsonKey(name: 'doc_note')
  String get docNote;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', includeToJson: false)
  DateTime get updatedAt;
  @override
  Patient get patient;
  @override
  @JsonKey(ignore: true)
  _$$PatientSummaryImplCopyWith<_$PatientSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
