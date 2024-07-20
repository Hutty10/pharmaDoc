// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientSummaryImpl _$$PatientSummaryImplFromJson(Map<String, dynamic> json) =>
    _$PatientSummaryImpl(
      id: (json['id'] as num).toInt(),
      serialNo: json['serial_no'] as String,
      pharmId: json['pharm_id'] as String,
      docId: json['doc_id'] as String,
      patientId: json['patient_id'] as String,
      pharmNote: json['pharm_note'] as String,
      docNote: json['doc_note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PatientSummaryImplToJson(
        _$PatientSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serial_no': instance.serialNo,
      'pharm_note': instance.pharmNote,
      'doc_note': instance.docNote,
      'patient': instance.patient,
    };
