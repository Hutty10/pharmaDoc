import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_proj/features/auth/controllers/repository/user_repository.dart';
import 'package:health_proj/features/auth/models/user.dart';

final userDataProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});
