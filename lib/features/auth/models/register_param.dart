import 'dart:io';

class RegisterParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String userType;
  final File licenseCertificate;

  RegisterParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userType,
    required this.licenseCertificate,
  });
}