// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_vital.freezed.dart';
part 'patient_vital.g.dart';

@freezed
class PatientVital with _$PatientVital {
  const factory PatientVital({
    required int id,
    @JsonKey(name: 'patient_id') required String patientId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'vital_type') required String vitalType,
    required String result,
    required String remark,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _PatientVital;

  factory PatientVital.fromJson(Map<String, dynamic> json) => _$PatientVitalFromJson(json);
}
