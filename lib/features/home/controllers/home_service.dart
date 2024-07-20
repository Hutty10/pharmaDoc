import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Service {
  Service({
    required Dio dio,
    required Future<String?> token,
    // required FlutterSecureStorage secureStorage,
  })  : _dio = dio,
        _token = token;
  // _secureStorage = secureStorage;
  final Dio _dio;
  final Future<String?> _token;
  // final FlutterSecureStorage _secureStorage;

  Future getRecentPatients() async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.get('/patient/home');
    if (response.statusCode == 200) {
      debugPrint('response: ${response.data}');
      return response.data;
    } else {
      print('error: ${response.data}' );
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future getCount() async {
    final token = await _token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.get('/user/statistics');
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
