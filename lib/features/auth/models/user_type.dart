import 'package:freezed_annotation/freezed_annotation.dart';

enum UserType {
  @JsonValue('pharm')
  pharmacist,
  @JsonValue('doc')
  doctors
}
