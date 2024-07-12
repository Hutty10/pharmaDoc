import 'package:health_proj/features/auth/models/user.dart';

class Pharm extends User {
  final int id;
  final String firstName;
  final String lastName;
  final String? specialization; // Optional field for specialization
  final String email;
  final String phone;
  final String? gender; // Optional field for gender
  final String type;
  final String? licenseNumber; // Optional field for license number
  final String licenseCertificate; // License certificate URL (String)
  final String? currentPractisingState; // Optional field for current state
  final String? currentPractisingAddress; // Optional field for current address
  final bool isActive;
  final String? photo; // Optional field for profile photo
  final String tempPhrase; // Temporary phrase (String)
  final String token; // Token (String)

  Pharm({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.specialization,
    required this.email,
    required this.phone,
    this.gender,
    required this.type,
    this.licenseNumber,
    required this.licenseCertificate,
    this.currentPractisingState,
    this.currentPractisingAddress,
    required this.isActive,
    this.photo,
    required this.tempPhrase,
    required this.token,
  });

  factory Pharm.fromJson(Map<String, dynamic> json) => Pharm(
        id: json['id'] as int,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        specialization: json['specialization'] as String?,
        email: json['email'] as String,
        phone: json['phone'] as String,
        gender: json['gender'] as String?,
        type: json['type'] as String,
        licenseNumber: json['license_number'] as String?,
        licenseCertificate: json['license_certificate'] as String,
        currentPractisingState: json['current_practising_state'] as String?,
        currentPractisingAddress: json['current_practising_address'] as String?,
        isActive: json['is_active'] as bool,
        photo: json['photo'] as String?,
        tempPhrase: json['temp_phrase'] as String,
        token: json['token'] as String,
      );
}
