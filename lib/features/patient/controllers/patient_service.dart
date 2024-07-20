import 'dart:developer';

import 'package:dio/dio.dart';

class PatientService {
  const PatientService(
      {required Dio dio,
      required Future<String?> token,
      required Future<String?> userType})
      : _dio = dio,
        _token = token,
        _userType = userType;
  final Dio _dio;
  final Future<String?> _token;
  final Future<String?> _userType;

  Future<Map<String, dynamic>> getPharmPatients() async {
    final token = await _token;
    final userType = await _userType;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final url = userType == 'doc' ? '/patient/doc/consulted' : '/patient/all';
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      log('status(e)------------${response.statusCode}');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future<Map<String, dynamic>> getPatient(String phone) async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.get('/patient/$phone');
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future updatePatient(Map<String, dynamic> data) async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.put('/patient/update', data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future addPatient(Map<String, dynamic> data) async {
    final token = await _token;
    log(token!);
    _dio.options.headers['Authorization'] = 'Bearer $token';
    log('${_dio.options.headers}');
    final response = await _dio.post('/patient/add', data: data);

    log('${response.statusCode}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      log('error ----------- ${response.statusCode}');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future getPatientVitals(String id) async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    log('before dio');
    final response = await _dio.get('/vital/all/$id');
    log('after dio');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future addPatientVitals(Map<String, dynamic> data) async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.post('/vital/add', data: data);
    log('${response.statusCode}');
    if (response.statusCode == 200) {
      log('${response.data}');
      return response.data;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future<Map<String, dynamic>> getDoctors(String location) async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.get('/generic/doctor/$location');
    log('${response.statusCode}');
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future referPatient(Map<String, dynamic> data) async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.post('/referral/send-patient', data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future getPatientSummary(String id) async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.get('/referral/view-summary/$id');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future searchPatient(String serialNo) async {
    final token = await _token;
    // RF669BC58E6DC4F
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.get('/patient/serial/$serialNo');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
