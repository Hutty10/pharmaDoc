import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final bool isRegistered;
  final bool isLoggedIn;

  const AuthState({
    required this.isLoading,
    this.error,
    required this.isRegistered,
    required this.isLoggedIn,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? isRegistered,
    bool? isLoggedIn,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isRegistered: isRegistered ?? this.isRegistered,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthStateNotifier(this._authRepository)
      : super(const AuthState(
            isLoading: false,
            error: null,
            isRegistered: false,
            isLoggedIn: false));

  void setLoading(bool isLoading) =>
      state = state.copyWith(isLoading: isLoading);

  void setRegistered(bool isRegistered) =>
      state = state.copyWith(isRegistered: isRegistered);
  void setLoggedIn(bool isLoggedIn) =>
      state = state.copyWith(isLoggedIn: isLoggedIn);
  void setError(String? error) => state = state.copyWith(error: error);

  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      await _authRepository.login(email: email, password: password);
      setError(null);
      setLoggedIn(true);
      // Login successful, navigate to home
      // GoRouter.of(context!).go('/home'); // Assuming context is available
    } on Exception catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
      setError(null);
    }
  }

  Future<void> register(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
    String userType,
    File licenseCertificate,
  ) async {
    setLoading(true);
    try {
      await _authRepository.register(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          userType: userType,
          licenseCertificate: licenseCertificate);
      setError(null);
      setRegistered(true);
    } on Exception catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
      setError(null);
    }
  }

  Future<void> logout() async {
    setLoading(true);
    try {
      await _authRepository.logout();
    } on Exception catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
      setError(null);
    }
  }
}
