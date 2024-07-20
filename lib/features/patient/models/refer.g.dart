// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferImpl _$$ReferImplFromJson(Map<String, dynamic> json) => _$ReferImpl(
      id: json['id'] as num,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      serialNo: json['serial_no'] as String,
      patient: Patientzzzz.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReferImplToJson(_$ReferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
      'serial_no': instance.serialNo,
      'patient': instance.patient,
    };

_$PatientzzzzImpl _$$PatientzzzzImplFromJson(Map<String, dynamic> json) =>
    _$PatientzzzzImpl(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> _$$PatientzzzzImplToJson(_$PatientzzzzImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
