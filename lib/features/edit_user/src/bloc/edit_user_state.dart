part of 'edit_user_bloc.dart';

class EditUserState {
  final int? id;
  final String serverError;
  final PersonalSubState personal;
  final AddressSubState address;
  final PassportSubState passport;
  final ContactsSubState contacts;
  final EmploymentSubState employment;
  final MiscSubState misc;

  const EditUserState.initial()
      : id = null,
        serverError = '',
        personal = const PersonalSubState.empty(),
        address = const AddressSubState.empty(),
        passport = const PassportSubState.empty(),
        contacts = const ContactsSubState.empty(),
        employment = const EmploymentSubState.empty(),
        misc = const MiscSubState.empty();

  EditUserState.fromUser(User user)
      : id = user.id,
        serverError = '',
        personal = PersonalSubState.fromUser(user),
        address = AddressSubState.fromUser(user),
        passport = PassportSubState.fromUser(user),
        contacts = ContactsSubState.fromUser(user),
        employment = EmploymentSubState.fromUser(user),
        misc = MiscSubState.fromUser(user);

  EditUserState({
    required this.id,
    required this.serverError,
    required this.personal,
    required this.address,
    required this.passport,
    required this.contacts,
    required this.employment,
    required this.misc,
  });

  EditUserState copyWith({
    String? serverError,
    PersonalSubState? personal,
    AddressSubState? address,
    PassportSubState? passport,
    ContactsSubState? contacts,
    EmploymentSubState? employment,
    MiscSubState? misc,
  }) {
    return EditUserState(
      id: id,
      serverError: serverError ?? this.serverError,
      personal: personal ?? this.personal,
      address: address ?? this.address,
      passport: passport ?? this.passport,
      contacts: contacts ?? this.contacts,
      employment: employment ?? this.employment,
      misc: misc ?? this.misc,
    );
  }

  EditUserState copyWithPersonal({
    String? firstName,
    String? middleName,
    String? lastName,
    Gender? gender,
  }) {
    return copyWith(
      personal: personal.copyWith(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        gender: gender,
      ),
    );
  }

  EditUserState copyWithAddress({
    String? birthAddress,
    String? currentCity,
    String? currentAddress,
    String? cityOfResidence,
    String? residenceAddress,
    String? citizenship,
    String? birthAddressError,
    String? currentCityError,
    String? currentAddressError,
    String? cityOfResidenceError,
    String? residenceAddressError,
    String? citizenshipError,
  }) {
    return copyWith(
      address: address.copyWith(
        birthAddress: birthAddress,
        birthAddressError: birthAddressError,
        citizenship: citizenship,
        citizenshipError: citizenshipError,
        currentAddress: currentAddress,
        currentAddressError: currentCityError,
        cityOfResidence: cityOfResidence,
        cityOfResidenceError: cityOfResidenceError,
        residenceAddress: residenceAddress,
        residenceAddressError: residenceAddressError,
        currentCity: currentCity,
        currentCityError: currentCityError,
      ),
    );
  }

  EditUserState copyWithPassport({
    String? passportSeries,
    String? passportNumber,
    String? idNumber,
    String? issuing,
    DateTime? issuingDate,
  }) {
    return copyWith(
      passport: passport.copyWith(
        passportSeries: passportSeries,
        passportNumber: passportNumber,
        idNumber: idNumber,
        issuing: issuing,
        issuingDate: issuingDate,
      ),
    );
  }

  EditUserState copyWithContacts({
    String? homeNumber,
    String? mobileNumber,
    String? email,
  }) {
    return copyWith(
      contacts: contacts.copyWith(
        homeNumber: homeNumber,
        mobileNumber: mobileNumber,
        email: email,
      ),
    );
  }

  EditUserState copyWithEmployment({
    String? position,
    String? placeOfWork,
    NullOrInt? monthlyIncome,
    bool? retiree,
  }) {
    return copyWith(
      employment: employment.copyWith(
        position: position,
        placeOfWork: placeOfWork,
        monthlyIncome: monthlyIncome,
        retiree: retiree,
      ),
    );
  }

  EditUserState copyWithMisc({
    FamilyStatus? familyStatus,
    final Disability? disability,
    final bool? conscription,
  }) {
    return copyWith(
      misc: misc.copyWith(
        familyStatus: familyStatus,
        disability: disability,
        conscription: conscription,
      ),
    );
  }

  EditUserState copyWithErrors({
    String? serverError,
    String? firstNameError,
    String? middleNameError,
    String? lastNameError,
    String? genderError,
    String? birthAddressError,
    String? currentCityError,
    String? currentAddressError,
    String? cityOfResidenceError,
    String? residenceAddressError,
    String? citizenshipError,
    String? emailError,
    String? mobileNumberError,
    String? homeNumberError,
    String? positionError,
    String? placeOfWorkError,
    String? monthlyIncomeError,
    String? retireeError,
    String? familyStatusError,
    String? passportSeriesError,
    String? passportNumberError,
    String? idNumberError,
    String? issuingError,
    String? issuingDateError,
  }) {
    return copyWith(
      serverError: serverError,
      personal: personal.copyWith(
        firstNameError: firstNameError,
        middleNameError: middleNameError,
        lastNameError: lastNameError,
        genderError: genderError,
      ),
      address: address.copyWith(
        birthAddressError: birthAddressError,
        currentCityError: currentCityError,
        currentAddressError: currentAddressError,
        cityOfResidenceError: cityOfResidenceError,
        residenceAddressError: residenceAddressError,
        citizenshipError: citizenshipError,
      ),
      contacts: contacts.copyWith(
        emailError: emailError,
        mobileNumberError: mobileNumberError,
        homeNumberError: homeNumberError,
      ),
      employment: employment.copyWith(
        positionError: positionError,
        placeOfWorkError: placeOfWorkError,
        monthlyIncomeError: monthlyIncomeError,
        retireeError: retireeError,
      ),
      misc: misc.copyWith(
        familyStatusError: familyStatusError,
      ),
      passport: passport.copyWith(
        passportSeriesError: passportSeriesError,
        passportNumberError: passportNumberError,
        idNumberError: idNumberError,
        issuingError: issuingError,
        issuingDateError: issuingDateError,
      ),
    );
  }

  bool didPersonalChanged(EditUserState state) => !identical(personal, state.personal);

  bool didAddressChanged(EditUserState state) => !identical(address, state.address);

  bool didPassportChanged(EditUserState state) => !identical(passport, state.passport);

  bool didContactsChanged(EditUserState state) => !identical(contacts, state.contacts);

  bool didEmploymentChanged(EditUserState state) => !identical(employment, state.employment);

  bool didMiscChanged(EditUserState state) => !identical(misc, state.misc);
}
