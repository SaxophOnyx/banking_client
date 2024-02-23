// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientDTO _$ClientDTOFromJson(Map<String, dynamic> json) => ClientDTO(
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String,
      lastName: json['last_name'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
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
      issuingDate:
          const DateTimeConverter().fromJson(json['issuing_date'] as int),
      homeNumber: json['home_number'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      email: json['email'] as String?,
      position: json['position'] as String?,
      placeOfWork: json['place_of_work'] as String?,
      monthlyIncome: json['monthly_income'] as int,
      retiree: json['retiree'] as bool,
      familyStatus: $enumDecode(_$FamilyStatusEnumMap, json['family_status']),
      disability: $enumDecodeNullable(_$DisabilityEnumMap, json['disability']),
      conscription: json['conscription'] as bool,
    );

Map<String, dynamic> _$ClientDTOToJson(ClientDTO instance) {
  final val = <String, dynamic>{
    'first_name': instance.firstName,
    'middle_name': instance.middleName,
    'last_name': instance.lastName,
    'gender': _$GenderEnumMap[instance.gender]!,
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
    'issuing_date': const DateTimeConverter().toJson(instance.issuingDate),
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
  val['family_status'] = _$FamilyStatusEnumMap[instance.familyStatus]!;
  writeNotNull('disability', _$DisabilityEnumMap[instance.disability]);
  val['conscription'] = instance.conscription;
  return val;
}

const _$GenderEnumMap = {
  Gender.female: 'Female',
  Gender.male: 'Male',
  Gender.other: 'Other',
};

const _$FamilyStatusEnumMap = {
  FamilyStatus.single: 'Single',
  FamilyStatus.married: 'Married',
};

const _$DisabilityEnumMap = {
  Disability.none: 'None',
  Disability.firstGroup: 'FirstGroup',
  Disability.secondGroup: 'SecondGroup',
  Disability.thirdGroup: 'ThirdGroup',
};
