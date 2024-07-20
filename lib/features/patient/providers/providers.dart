import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_proj/features/patient/models/patient_vital.dart';

import '../../../core/providers.dart';
import '../controllers/patient_repository.dart';
import '../controllers/patient_service.dart';
import '../models/patient.dart';
import '../models/refer.dart';

// final serviceProvider = Provider<PatientService>((ref) {
//   final dio = ref.read(dioProvider);
//   final token = ref.read(tokenProvider).value!;
//   return PatientService(dio: dio, token: token);
// });

final repositoryProvider = Provider<PatientRepository>((ref) {
  final dio = ref.read(dioProvider);
  final token = ref.read(secureStorageProvider).read(key: 'auth_token');
  final userType = ref.read(secureStorageProvider).read(key: 'user_type');
  final service = PatientService(dio: dio, token: token, userType: userType);
  // final service = ref.watch(serviceProvider);
  return PatientRepository(patientService: service);
});

final getPatientProvider = FutureProvider<List<Patient>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return await repository.getPharmPatients();
});

final getPatientSingleProvider =
    FutureProvider.family<Patient, String>((ref, phone) async {
  final repository = ref.read(repositoryProvider);
  return await repository.getPatient(phone);
});

final addPatientProvider =
    FutureProvider.family.autoDispose<Patient, Patient>((ref, patient) async {
  final repository = ref.read(repositoryProvider);
  return await repository.addPatient(patient);
});

// final patientNotifierProvider =
//     StateNotifierProvider.autoDispose<PatientNotifier, PatientState>(
//   (ref) {
//     final repository = ref.watch(repositoryProvider);
//     return PatientNotifier(repository);
//   },
// );

final addPatientVitalProvider =
    FutureProvider.family<Future, Map<String, dynamic>>((ref, data) async {
  final repository = ref.read(repositoryProvider);
  return repository.addPatientVitals(data);
});

final getDoctorNAmeProvider = FutureProvider.autoDispose
    .family<List<(String, String)>, String>((ref, location) async {
  return await ref.read(repositoryProvider).getDoctorsName(location);
});
final getVitalsProvider = FutureProvider.autoDispose
    .family<List<PatientVital>, String>((ref, patientId) async {
  return await ref.read(repositoryProvider).getPatientVitals(patientId);
});

final referPatientProvider =
    FutureProvider.family<Future, Map<String, dynamic>>((ref, data) async {
  final repository = ref.read(repositoryProvider);
  return await repository.referPatient(data);
});

final searchReferProvider = FutureProvider.autoDispose
    .family<List<Refer>, String>((ref, serialNo) async {
  final repo = ref.read(repositoryProvider);
  return await repo.searchPatient(serialNo);
});
