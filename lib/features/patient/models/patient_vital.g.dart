// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_vital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientVitalImpl _$$PatientVitalImplFromJson(Map<String, dynamic> json) =>
    _$PatientVitalImpl(
      id: (json['id'] as num).toInt(),
      patientId: json['patient_id'] as String,
      userId: json['user_id'] as String,
      vitalType: json['vital_type'] as String,
      result: json['result'] as String,
      remark: json['remark'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PatientVitalImplToJson(_$PatientVitalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient_id': instance.patientId,
      'user_id': instance.userId,
      'vital_type': instance.vitalType,
      'result': instance.result,
      'remark': instance.remark,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
