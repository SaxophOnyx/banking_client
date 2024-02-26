import 'package:json_annotation/json_annotation.dart';

part 'client_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ClientEntity {
  final String id;

  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;

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
  final int issuingDate;

  final String? homeNumber;
  final String? mobileNumber;
  final String? email;

  final String? position;
  final String? placeOfWork;
  final int monthlyIncome;
  final bool retiree;

  final String familyStatus;
  final String disability;
  final bool conscription;

  const ClientEntity({
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

  factory ClientEntity.fromJson(Map<String, dynamic> json) => _$ClientEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ClientEntityToJson(this);
}
