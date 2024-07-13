import 'package:health_proj/features/auth/models/user.dart';

class Pharm extends User {
  Pharm(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.phone,
      required super.type,
      required super.licenseCertificate,
      required super.isActive,
      required super.tempPhrase,
      required super.currentPractisingAddress,
      required super.currentPractisingState,
      required super.gender,
      required super.licenseNumber,
      required super.photo,
      required super.specialization,
      required super.token});

  factory Pharm.fromJson(Map<String, dynamic> json) => Pharm(
        id: json['id'] as int,
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? "",
        specialization: json['specialization'] ?? "",
        email: json['email'] ?? "",
        phone: json['phone'] ?? "",
        gender: json['gender'] ?? "",
        type: json['type'] as String,
        licenseNumber: json['license_number'] ?? "",
        licenseCertificate: json['license_certificate'] ?? "",
        currentPractisingState: json['current_practising_state'] ?? '',
        currentPractisingAddress: json['current_practising_address'] ?? '',
        isActive: json['is_active'] == 0 ? true : false,
        photo: json['photo'] ?? "",
        tempPhrase: json['temp_phrase'] ?? "",
        token: json['token'] as String,
      );
}
