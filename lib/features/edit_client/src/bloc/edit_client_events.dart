part of 'edit_client_bloc.dart';

abstract class EditClientEvent {
  const EditClientEvent();
}

class UpdatePersonal extends EditClientEvent {
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

class UpdateAddress extends EditClientEvent {
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

class UpdatePassport extends EditClientEvent {
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

class UpdateContacts extends EditClientEvent {
  final String? homeNumber;
  final String? mobileNumber;
  final String? email;

  const UpdateContacts({
    this.homeNumber,
    this.mobileNumber,
    this.email,
  });
}

class UpdateEmployment extends EditClientEvent {
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

class UpdateMisc extends EditClientEvent {
  final FamilyStatus? familyStatus;
  final Disability? disability;
  final bool? conscription;

  const UpdateMisc({
    this.familyStatus,
    this.disability,
    this.conscription,
  });
}

class SubmitPressed extends EditClientEvent {
  const SubmitPressed();
}
