// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      patientSerial: json['patient_serial'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      age: json['age'] as String,
      stateOfOrigin: json['state_of_origin'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'age': instance.age,
      'state_of_origin': instance.stateOfOrigin,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
    };
