// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
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
  final String token;
  User({
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userType': 'pharm',
      'licenseCertificate': licenseCertificate,
      "phone": phone,
      "current_practising_address": "qqqq",
      "current_practising_state": "Lagos"
    };
  }

  String toJson() => json.encode(toMap());

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? specialization,
    String? email,
    String? phone,
    String? gender,
    String? type,
    String? licenseNumber,
    String? licenseCertificate,
    String? currentPractisingState,
    String? currentPractisingAddress,
    bool? isActive,
    String? photo,
    String? tempPhrase,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      specialization: specialization ?? this.specialization,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      type: type ?? this.type,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      licenseCertificate: licenseCertificate ?? this.licenseCertificate,
      currentPractisingState:
          currentPractisingState ?? this.currentPractisingState,
      currentPractisingAddress:
          currentPractisingAddress ?? this.currentPractisingAddress,
      isActive: isActive ?? this.isActive,
      photo: photo ?? this.photo,
      tempPhrase: tempPhrase ?? this.tempPhrase,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, specialization: $specialization, email: $email, phone: $phone, gender: $gender, type: $type, licenseNumber: $licenseNumber, licenseCertificate: $licenseCertificate, currentPractisingState: $currentPractisingState, currentPractisingAddress: $currentPractisingAddress, isActive: $isActive, photo: $photo, tempPhrase: $tempPhrase, token: $token)';
  }
}
