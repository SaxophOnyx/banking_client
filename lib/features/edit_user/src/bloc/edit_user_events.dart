part of 'edit_user_bloc.dart';

abstract class EditUserEvent {
  const EditUserEvent();
}

class UpdatePersonal extends EditUserEvent {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final Gender? gender;

  const UpdatePersonal({
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
  });
}

class UpdateAddress extends EditUserEvent {
  final String? birthAddress;
  final String? currentCity;
  final String? currentAddress;
  final String? cityOfResidence;
  final String? residenceAddress;
  final String? citizenship;

  const UpdateAddress({
    this.birthAddress,
    this.currentCity,
    this.currentAddress,
    this.cityOfResidence,
    this.residenceAddress,
    this.citizenship,
  });
}

class UpdatePassport extends EditUserEvent {
  final String? passportSeries;
  final String? passportNumber;
  final String? idNumber;
  final String? issuing;
  final DateTime? issuingDate;

  const UpdatePassport({
    this.passportSeries,
    this.passportNumber,
    this.idNumber,
    this.issuing,
    this.issuingDate,
  });
}

class UpdateContacts extends EditUserEvent {
  final String? homeNumber;
  final String? mobileNumber;
  final String? email;

  const UpdateContacts({
    this.homeNumber,
    this.mobileNumber,
    this.email,
  });
}

class UpdateEmployment extends EditUserEvent {
  final String? position;
  final String? placeOfWork;
  final NullOrInt? monthlyIncome;
  final bool? retiree;

  const UpdateEmployment({
    this.position,
    this.placeOfWork,
    this.monthlyIncome,
    this.retiree,
  });
}

class UpdateMisc extends EditUserEvent {
  final FamilyStatus? familyStatus;
  final Disability? disability;
  final bool? conscription;

  const UpdateMisc({
    this.familyStatus,
    this.disability,
    this.conscription,
  });
}

class SubmitPressed extends EditUserEvent {
  const SubmitPressed();
}
