import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../service/auth_service.dart';

class AuthRepository {
  AuthRepository(
      {required AuthService authService,
      required FlutterSecureStorage secureStorage})
      : _authService = authService,
        _secureStorage = secureStorage;

  final AuthService _authService;
  final FlutterSecureStorage _secureStorage;
  final String _storageKey = 'auth_token';

  Future<void> logout() async {
    await _secureStorage.delete(key: _storageKey);
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String userType,
    required File licenseCertificate,
  }) async {
    try {
      _authService.register(
        email,
        password,
        firstName,
        lastName,
        phoneNumber,
        userType,
        licenseCertificate,
      ) as Map<String, dynamic>;
    } on DioException catch (e) {
      _handleDioException(e);
    } catch (e) {
      _handleGeneralException(Exception(e));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final data =
          await _authService.login(email, password) as Map<String, dynamic>;
      final token = data['data']['token'] as String;
      final userType = data['data']['type'] as String;
      // print(token);
      await Future.wait([_saveToken(token), _saveUserType(userType)]);
    } on DioException catch (e) {
      _handleDioException(e);
    } catch (e) {
      _handleGeneralException(Exception(e));
    }
  }

  Future<void> _saveUserType(String type) async {
    await _secureStorage.write(key: 'user_type', value: type);
  }

  Future<void> _saveToken(String token) async {
    await _secureStorage.write(key: _storageKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _storageKey);
  }

  Stream<AuthenticationStatus> get authStatus =>
      _secureStorage.read(key: _storageKey).asStream().map(
            (token) => token != null
                ? AuthenticationStatus.authenticated
                : AuthenticationStatus.unauthenticated,
          );

  void _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      throw Exception('Connection timeout. Please try again later.');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      throw Exception('Receive timeout. Please try again later.');
    } else if (e.type == DioExceptionType.badResponse) {
      if (e.response?.statusCode == 400) {
        throw Exception('Bad request: ${e.response?.data['errors']}');
      } else if (e.response?.statusCode == 422) {
        throw Exception('${e.response?.data['errors']}');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized: Invalid credentials.');
      } else if (e.response?.statusCode == 403) {
        throw Exception(
            'Forbidden: You do not have permission to perform this action.');
      } else if (e.response?.statusCode == 404) {
        throw Exception(
            'Not found: The requested resource could not be found.');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error: Please try again later.');
      } else {
        throw Exception('Unexpected error: ${e.response?.data['message']}');
      }
    } else {
      throw Exception('Unexpected error: ${e.message}');
    }
  }

  void _handleGeneralException(Exception e) {
    log('not here');
    // Handle any other exceptions that are not related to Dio
    throw Exception('An unexpected error occurred: $e');
  }
}

enum AuthenticationStatus {
  /// Authenticated
  authenticated,

  /// Unauthenticated
  unauthenticated,
}
