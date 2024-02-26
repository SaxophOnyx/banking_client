// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientDTOEntity _$ClientDTOEntityFromJson(Map<String, dynamic> json) =>
    ClientDTOEntity(
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String,
      lastName: json['last_name'] as String,
      gender: json['gender'] as String,
      birthAddress: json['birth_address'] as String,
      currentCity: json['current_city'] as String,
      currentAddress: json['current_address'] as String,
      cityOfResidence: json['city_of_residence'] as String,
      residenceAddress: json['residence_address'] as String,
      citizenship: json['citizenship'] as String,
      passportSeries: json['passport_series'] as String,
      passportNumber: json['passport_number'] as String,
      idNumber: json['id_number'] as String,
      issuing: json['issuing'] as String,
      issuingDate: json['issuing_date'] as int,
      homeNumber: json['home_number'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      email: json['email'] as String?,
      position: json['position'] as String?,
      placeOfWork: json['place_of_work'] as String?,
      monthlyIncome: json['monthly_income'] as int,
      retiree: json['retiree'] as bool,
      familyStatus: json['family_status'] as String,
      disability: json['disability'] as String,
      conscription: json['conscription'] as bool,
    );

Map<String, dynamic> _$ClientDTOEntityToJson(ClientDTOEntity instance) {
  final val = <String, dynamic>{
    'first_name': instance.firstName,
    'middle_name': instance.middleName,
    'last_name': instance.lastName,
    'gender': instance.gender,
    'birth_address': instance.birthAddress,
    'current_city': instance.currentCity,
    'current_address': instance.currentAddress,
    'city_of_residence': instance.cityOfResidence,
    'residence_address': instance.residenceAddress,
    'citizenship': instance.citizenship,
    'passport_series': instance.passportSeries,
    'passport_number': instance.passportNumber,
    'id_number': instance.idNumber,
    'issuing': instance.issuing,
    'issuing_date': instance.issuingDate,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('home_number', instance.homeNumber);
  writeNotNull('mobile_number', instance.mobileNumber);
  writeNotNull('email', instance.email);
  writeNotNull('position', instance.position);
  writeNotNull('place_of_work', instance.placeOfWork);
  val['monthly_income'] = instance.monthlyIncome;
  val['retiree'] = instance.retiree;
  val['family_status'] = instance.familyStatus;
  val['disability'] = instance.disability;
  val['conscription'] = instance.conscription;
  return val;
}
