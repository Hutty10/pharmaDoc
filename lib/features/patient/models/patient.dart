// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    @JsonKey(includeToJson: false) int? id,
    @JsonKey(name: 'user_id', includeToJson: false) String? userId,
    @JsonKey(name: 'patient_serial', includeToJson: false)
    String? patientSerial,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String age,
    @JsonKey(name: 'state_of_origin') required String stateOfOrigin,
    required String phone,
    required String email,
    required String address,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
