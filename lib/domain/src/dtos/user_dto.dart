import 'package:banking_client/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../converters/date_time_converter.dart';

part 'user_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class UserDTO {
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
  final Disability? disability;
  final bool conscription;

  const UserDTO({
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
    required this.homeNumber,
    required this.mobileNumber,
    required this.email,
    required this.position,
    required this.placeOfWork,
    required this.monthlyIncome,
    required this.retiree,
    required this.familyStatus,
    required this.disability,
    required this.conscription,
  });

  factory UserDTO.fromUser(User user) {
    return UserDTO(
      firstName: user.firstName,
      middleName: user.middleName,
      lastName: user.lastName,
      gender: user.gender,
      birthAddress: user.birthAddress,
      currentCity: user.currentCity,
      currentAddress: user.currentAddress,
      cityOfResidence: user.cityOfResidence,
      residenceAddress: user.residenceAddress,
      citizenship: user.citizenship,
      passportSeries: user.passportSeries,
      passportNumber: user.passportNumber,
      idNumber: user.idNumber,
      issuing: user.issuing,
      issuingDate: user.issuingDate,
      homeNumber: user.homeNumber,
      mobileNumber: user.mobileNumber,
      email: user.email,
      position: user.position,
      placeOfWork: user.placeOfWork,
      monthlyIncome: user.monthlyIncome,
      retiree: user.retiree,
      familyStatus: user.familyStatus,
      disability: user.disability,
      conscription: user.conscription,
    );
  }

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
