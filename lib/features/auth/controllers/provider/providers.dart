import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers.dart';
import '../../models/register_param.dart';
import '../repository/auth_repository.dart';
import '../service/auth_service.dart';
import 'auth_notifier.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio: dio);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.watch(authServiceProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthRepository(authService: authService, secureStorage: secureStorage);
});

final authStateProvider = StateProvider<String?>((ref) {
  return null;
});

final authNotifierProvider =
    StateNotifierProvider.autoDispose<AuthStateNotifier, AuthState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthStateNotifier(authRepository);
  },
);



// final registerProvider =
//     FutureProvider.family<void, RegisterParams>((ref, param) async {
//   return await ref.watch(authNotifierProvider.notifier).register(
//         param.email,
//         param.password,
//         param.firstName,
//         param.lastName,
//         param.phoneNumber,
//         param.userType,
//         param.licenseCertificate,
//       );
// });

// final logoutProvider = FutureProvider<void>((ref) async {
//   return await ref.watch(authNotifierProvider.notifier).logout();
// });
