import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_proj/features/auth/models/user.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void assignUser(User user) {
    state = user;
  }
}
