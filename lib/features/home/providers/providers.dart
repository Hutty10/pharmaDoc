import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../patient/models/patient.dart';
import '../controllers/home_repository.dart';
import '../controllers/home_service.dart';

final serviceProvider = Provider.autoDispose<Service>((ref) {
  final dio = ref.watch(dioProvider);
  final token = ref.read(secureStorageProvider).read(key: 'auth_token');
  return Service(dio: dio, token: token);
});

final repositoryProvider = Provider<Repository>((ref) {
  final service = ref.read(serviceProvider);
  return Repository(service: service);
});

final recentPatientProvider =
    FutureProvider.autoDispose<List<Patient>>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return await repository.getRecentPatients();
});

final countProvider = FutureProvider<int>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return await repository.getCount();
});
