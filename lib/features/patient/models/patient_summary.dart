// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'patient.dart';

part 'patient_summary.freezed.dart';
part 'patient_summary.g.dart';

@freezed
class PatientSummary with _$PatientSummary {
  const factory PatientSummary({
    required int id,
    @JsonKey(name: 'serial_no') required String serialNo,
    @JsonKey(name: 'pharm_id', includeToJson: false) required String pharmId,
    @JsonKey(name: 'doc_id', includeToJson: false) required String docId,
    @JsonKey(name: 'patient_id', includeToJson: false)
    required String patientId,
    @JsonKey(name: 'pharm_note') required String pharmNote,
    @JsonKey(name: 'doc_note') required String docNote,
    @JsonKey(name: 'created_at', includeToJson: false)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', includeToJson: false)
    required DateTime updatedAt,
    required Patient patient,
  }) = _PatientSummary;

  factory PatientSummary.fromJson(Map<String, dynamic> json) =>
      _$PatientSummaryFromJson(json);
}
