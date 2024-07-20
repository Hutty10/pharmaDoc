// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import './patient_repository.dart';
// import '../models/patient.dart';
// import 'patient_state.dart';

// class PatientNotifier extends StateNotifier<PatientState> {
//   final PatientRepository _repository;
//   PatientNotifier(this._repository) : super(const PatientState.initial()) {
//     _initialize();
//   }

//   Future<void> _initialize() async {
//     await getPharmPatients();
//   }

  

//   Future<void> getPharmPatients() async {
//     state = const PatientState.loading();
//     try {
//       final patients = await _repository.getPharmPatients();
//       state = PatientState.data(patients);
//     } catch (e) {
//       state = PatientState.error(e.toString());
//     }
//   }

//   // Future<void> getPharmPatients() async {
//   //   final patients = await _repository.getPharmPatients();
//   //   state = patients;
//   // }

//   // Future<void> updatePatient(Patient patient) async {
//   //   final updatedPatient = await _repository.updatePatient(patient);
//   //   final index =
//   //       state.indexWhere((element) => element.id == updatedPatient.id);
//   //   if (index != -1) {
//   //     state = [...state]..[index] = updatedPatient;
//   //   }
//   // }

//   // Future<void> addPatient(Patient patient) async {
//   //   final newPatient = await _repository.addPatient(patient);
//   //   state = [newPatient, ...state];
//   // }
// }
