import 'package:domain/src/models/disability.dart';
import 'package:json_annotation/json_annotation.dart';

import '../converters/date_time_converter.dart';
import 'family_status.dart';
import 'gender.dart';

part 'client.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Client {
  final int id;

  final String firstName;
  final String middleName;
  final String lastName;
  final Gender gender;

  final String birthAddress;
  final String currentCity;
  final String currentAddress;
  final String cityOfResidence;
  final String residenceAddress;
  final String citizenship;

  final String passportSeries;
  final String passportNumber;
  final String idNumber;
  final String issuing;
  @DateTimeConverter()
  final DateTime issuingDate;

  final String? homeNumber;
  final String? mobileNumber;
  final String? email;

  final String? position;
  final String? placeOfWork;
  final int monthlyIncome;
  final bool retiree;

  final FamilyStatus familyStatus;
  final Disability disability;
  final bool conscription;

  const Client({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.birthAddress,
    required this.currentCity,
    required this.currentAddress,
    required this.cityOfResidence,
    required this.residenceAddress,
    required this.citizenship,
    required this.passportSeries,
    required this.passportNumber,
    required this.idNumber,
    required this.issuing,
    required this.issuingDate,
    this.homeNumber,
    this.mobileNumber,
    this.email,
    this.position,
    this.placeOfWork,
    required this.monthlyIncome,
    required this.retiree,
    required this.familyStatus,
    required this.disability,
    required this.conscription,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
