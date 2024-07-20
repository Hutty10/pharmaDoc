import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:health_proj/features/auth/models/user.dart';

class AuthService {
  AuthService({required Dio dio}) : _dio = dio;
  final Dio _dio;
  Future<Map<String, dynamic>> updateUserCredentials(
      User user, String? licenseFIle, ref) async {
    final token = user.token;

    _dio.options.headers["Authorization"] = "Bearer $token";
    log(token);

    var data = {
      "phone": user.phone,
      "current_practising_address": user.currentPractisingAddress,
      "current_practising_state": user.currentPractisingState
    };
    log(data.toString());
    final Response response = await _dio.put(
      '/user/update',
      data: data,
    );

    if (response.statusCode == 200) {
      var map = Map<String, dynamic>.from(response.data);
      log(map.toString());
      return map;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future register(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
    String userType,
    File licenseCertificate,
  ) async {
    final FormData formData = FormData.fromMap({
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phoneNumber,
      'type': userType,
      // 'type': 'pharm',
      'license_certificate': await MultipartFile.fromFile(
        licenseCertificate.path,
        filename: licenseCertificate.path.split('/').last,
      ),
    });
    final Response response = await _dio.post('/auth/register', data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Response response = await _dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var map = Map<String, dynamic>.from(response.data);
      log('fetched Complete');
      log(map.toString());
      return map;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
