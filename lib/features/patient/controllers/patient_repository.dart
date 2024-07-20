import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../models/patient_vital.dart';
import '../models/refer.dart';
import 'patient_service.dart';
import '../models/patient.dart';
import '../models/patient_summary.dart';

class PatientRepository {
  PatientRepository({required PatientService patientService})
      : _patientService = patientService;
  final PatientService _patientService;

  Future<List<Patient>> getPharmPatients() async {
    try {
      final responseData = await _patientService.getPharmPatients();
      final data = responseData['data'] as List<dynamic>;
      final List<Patient> patients =
          data.map((e) => Patient.fromJson(e)).toList();
      return patients;
    } catch (e) {
      throw Exception('Failed to load patients');
    }
  }

  Future<Patient> getPatient(String phone) async {
    try {
      final responseData = await _patientService.getPatient(phone);
      final data = responseData['data'] as Map<String, dynamic>;
      final patient = Patient.fromJson(data);
      return patient;
    } catch (e) {
      throw Exception('Failed to load patient');
    }
  }

  Future addPatient(Patient patient) async {
    try {
      print(patient.toJson());
      final responseData = await _patientService.addPatient(patient.toJson());
      log(responseData['data']);

      return patient;
    } catch (e) {
      throw Exception('Failed to add patient');
    }
  }

  Future updatePatient(Patient patient) async {
    try {
      final responseData =
          await _patientService.updatePatient(patient.toJson());
      if (responseData['message'] == "Patient Information updated") {
        return patient;
      }
      throw Exception('Failed to update patient');
    } catch (e) {
      throw Exception('Failed to update patient');
    }
  }

  Future<List<PatientVital>> getPatientVitals(String id) async {
    try {
      log('starting to fetch vitals');
      final responseData =
          await _patientService.getPatientVitals(id) as Map<String, dynamic>;
      log('after service');
      final data = responseData['data'] as List<dynamic>;
      log(data.toString());
      final patientVitals = data.map((e) => PatientVital.fromJson(e)).toList();
      return patientVitals;
    } catch (e) {
      throw Exception('Failed to load patient vitalsssss');
    }
  }

  Future addPatientVitals(Map<String, dynamic> data) async {
    try {
      final responseData = await _patientService.addPatientVitals(data);
      return responseData;
    } catch (e) {
      throw Exception('Failed to add patient vitals');
    }
  }

  Future<List<(String, String)>> getDoctorsName(String location) async {
    try {
      log('starting to fetch doctors');
      final responseData = await _patientService.getDoctors(location);
      log('after fetching doctors');
      final doctorsInfo = responseData['data'] as List<dynamic>;
      final doctors = doctorsInfo
          .map(
              (e) => ("${e['id']}", "Dr. ${e['first_name']} ${e['last_name']}"))
          .toList();
      log('doctors $doctors');
      return doctors;
    } catch (e) {
      log(e.toString());
      throw Exception('Error fetching doctors for $location');
    }
  }

  Future referPatient(Map<String, dynamic> data) async {
    try {
      final responseData = await _patientService.referPatient(data);
      return responseData;
    } catch (e) {
      throw Exception('Failed to refer patient');
    }
  }

  Future<PatientSummary> getPatientSummary(String id) async {
    try {
      final responseData =
          await _patientService.getPatientSummary(id) as Map<String, dynamic>;
      final data = responseData['data'] as Map<String, dynamic>;
      final patientSummary = PatientSummary.fromJson(data);
      return patientSummary;
    } catch (e) {
      throw Exception('Failed to load patient summary');
    }
  }

  Future<List<Refer>> searchPatient(String serialNo) async {
    try {
      final responseData = await _patientService.searchPatient(serialNo);
      final dat = responseData['data'] as List<dynamic>;
      log('data$dat');
      print(dat.length);
      final data = dat.map((e) => Refer.fromJson(e)).toList();
      log('data$data');
      return data;
      // return {
      //   'id': data['id'],
      //   'time': data['updated_at'] as String,
      //   'serial_no': data['serial_no'] as String,
      //   'name': "${patient['first_name']} ${patient['last_name']}",
      // };
    } catch (e) {
      log(e.toString());
      throw Exception('Patient not found');
    }
  }
}
