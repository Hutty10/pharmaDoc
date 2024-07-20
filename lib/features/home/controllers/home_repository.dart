import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../patient/models/patient.dart';
import 'home_service.dart';

class Repository {
  Repository({required Service service}) : _service = service;
  final Service _service;

  Future<List<Patient>> getRecentPatients() async {
    try {
      final responseData =
          await _service.getRecentPatients() as Map<String, dynamic>;
      final data = responseData['data'] as List<Map<String, dynamic>>;
      debugPrint('data: $data');
      // final patients = data.map((e) => Patient.fromJson(e)).toList();
      return [];
    } catch (e) {
      debugPrint('error: $e');
      throw Exception('Failed to load recent patients');
    }
  }

  Future<int> getCount() async {
    try {
      final responseData = await _service.getCount() as Map<String, dynamic>;
      final data = responseData['data'] as Map<String, dynamic>;
      log('$data');
      final count = data['count'] as int;
      return count;
    } catch (e) {
      debugPrint('error: $e');
      throw Exception('Failed to load count');
    }
  }
}
