import 'package:health_proj/features/auth/models/user.dart';

class Doctor extends User {
  Doctor(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.phone,
      required super.specialization,
      required super.currentPractisingAddress,
      required super.currentPractisingState,
      required super.gender,
      required super.licenseNumber,
      required super.photo,
      required super.type,
      required super.licenseCertificate,
      required super.isActive,
      required super.tempPhrase,
      required super.token});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json['id'] as int,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        specialization: json['specialization'] as String?,
        email: json['email'] as String,
        phone: json['phone'] as String,
        gender: json['gender'] as String?,
        type: json['type'] as String,
        licenseNumber: json['license_number'] as String?,
        licenseCertificate: json['license_certificate'] ?? '',
        currentPractisingState: json['current_practising_state'] as String?,
        currentPractisingAddress: json['current_practising_address'] as String?,
        isActive: json['is_active'] == 0 ? true : false,
        photo: json['photo'] as String?,
        tempPhrase: json['tempPhrase'] ?? "",
        token: json['token'] ?? '',
      );

  // Add additional methods like toJson if needed
}
