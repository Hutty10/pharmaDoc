abstract class User {
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
}
