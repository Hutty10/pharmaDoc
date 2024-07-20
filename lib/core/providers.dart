import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio();
    dio.options.baseUrl = 'https://pharmdoc.gofortedigitals.com';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    return dio;
  },
);

final tokenProvider = FutureProvider<String?>((ref) async {
  final secureStorage = ref.watch(secureStorageProvider);
  return await secureStorage.read(key: 'auth_token');
});

final userTypeProvider = FutureProvider<String?>((ref) async {
  final secureStorage = ref.read(secureStorageProvider);
  return await secureStorage.read(key: 'user_type');
});
