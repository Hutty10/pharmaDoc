import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginVisibilityProvider = StateProvider.autoDispose<bool>((ref) => false);
final registerVisibilityProvider = StateProvider.autoDispose<bool>((ref) => false);
final rememberPasswordProvider = StateProvider.autoDispose<bool>((ref) => false);
final showNewPasswordProvider = StateProvider.autoDispose<bool>((ref) => false);
final showNewCPasswordProvider = StateProvider.autoDispose<bool>((ref) => false);