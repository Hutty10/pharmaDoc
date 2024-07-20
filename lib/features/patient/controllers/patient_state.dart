import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/patient.dart';

part 'patient_state.freezed.dart';

@freezed
class PatientState with _$PatientState {
  const factory PatientState.initial() = _Initial;
  const factory PatientState.loading() = _Loading;
  const factory PatientState.data(List<Patient> patients) = _Data;
  const factory PatientState.error(String message) = _Error;
}
