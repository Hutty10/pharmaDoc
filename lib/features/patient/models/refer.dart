// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'refer.freezed.dart';
part 'refer.g.dart';

@freezed
abstract class Refer with _$Refer {
  const factory Refer({
    required num id,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'serial_no')required String serialNo,
    required Patientzzzz patient,
  }) = _Refer;

  factory Refer.fromJson(Map<String, dynamic> json) => _$ReferFromJson(json);
}

@freezed
abstract class Patientzzzz with _$Patientzzzz {
  const factory Patientzzzz({
    @JsonKey(name: 'first_name')required String firstName,
    @JsonKey(name: 'last_name')required String lastName,
  }) = _Patientzzzz;

  factory Patientzzzz.fromJson(Map<String, dynamic> json) => _$PatientzzzzFromJson(json);
}
