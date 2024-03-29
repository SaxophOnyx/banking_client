import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'substates/address_substate.dart';
import 'substates/contacts_substate.dart';
import 'substates/employment_substate.dart';
import 'substates/misc_substate.dart';
import 'substates/passport_substate.dart';
import 'substates/personal_substate.dart';

part 'edit_client_events.dart';
part 'edit_client_state.dart';

class EditClientBloc extends Bloc<EditClientEvent, EditClientState> {
  final AppRouter _appRouter;
  final CreateClientUseCase _createClientUseCase;
  final UpdateClientUseCase _updateClientUseCase;

  EditClientBloc({
    required AppRouter appRouter,
    required CreateClientUseCase createClientUseCase,
    required UpdateClientUseCase updateClientUseCase,
    Client? initialData,
  })  : _appRouter = appRouter,
        _createClientUseCase = createClientUseCase,
        _updateClientUseCase = updateClientUseCase,
        super(initialData != null ? EditClientState.fromClient(initialData) : const EditClientState.initial()) {
    on<UpdatePersonal>(_onUpdatePersonal);
    on<UpdateAddress>(_onUpdateAddress);
    on<UpdatePassport>(_onUpdatePassport);
    on<UpdateContacts>(_onUpdateContacts);
    on<UpdateEmployment>(_onUpdateEmployment);
    on<UpdateMisc>(_onUpdateMisc);
    on<SubmitPressed>(_onSubmitPressed);
  }

  void _onUpdatePersonal(
    UpdatePersonal event,
    Emitter<EditClientState> emit,
  ) {
    emit(state.copyWithPersonal(
      firstName: event.firstName,
      middleName: event.middleName,
      lastName: event.lastName,
      gender: event.gender,
    ));
  }

  void _onUpdateAddress(
    UpdateAddress event,
    Emitter<EditClientState> emit,
  ) {
    emit(state.copyWithAddress(
      birthAddress: event.birthAddress,
      residenceAddress: event.residenceAddress,
      currentCity: event.currentCity,
      currentAddress: event.currentAddress,
      cityOfResidence: event.cityOfResidence,
      citizenship: event.citizenship,
    ));
  }

  void _onUpdatePassport(
    UpdatePassport event,
    Emitter<EditClientState> emit,
  ) {
    emit(state.copyWithPassport(
      passportNumber: event.passportNumber,
      passportSeries: event.passportSeries,
      idNumber: event.idNumber,
      issuingDate: event.issuingDate,
      issuing: event.issuing,
    ));
  }

  void _onUpdateContacts(
    UpdateContacts event,
    Emitter<EditClientState> emit,
  ) {
    emit(state.copyWithContacts(
      homeNumber: event.homeNumber,
      mobileNumber: event.mobileNumber,
      email: event.email,
    ));
  }

  void _onUpdateEmployment(
    UpdateEmployment event,
    Emitter<EditClientState> emit,
  ) {
    emit(state.copyWithEmployment(
      position: event.position,
      placeOfWork: event.placeOfWork,
      monthlyIncome: event.monthlyIncome,
      retiree: event.retiree,
    ));
  }

  void _onUpdateMisc(
    UpdateMisc event,
    Emitter<EditClientState> emit,
  ) {
    emit(state.copyWithMisc(
      familyStatus: event.familyStatus,
      disability: event.disability,
      conscription: event.conscription,
    ));
  }

  Future<void> _onSubmitPressed(
    SubmitPressed event,
    Emitter<EditClientState> emit,
  ) async {
    // Personal
    final PersonalSubState personal = state.personal;
    final String? firstNameError = ValidationService.notEmpty(personal.firstName);
    final String? middleNameError = ValidationService.notEmpty(personal.middleName);
    final String? lastNameError = ValidationService.notEmpty(personal.lastName);
    final String? genderError = ValidationService.notEmptyGender(personal.gender);

    // Address
    final AddressSubState address = state.address;
    final String? birthAddressError = ValidationService.notEmpty(address.birthAddress);
    final String? currentCityError = ValidationService.notEmpty(address.currentCity);
    final String? currentAddressError = ValidationService.notEmpty(address.currentAddress);
    final String? cityOfResidenceError = ValidationService.notEmpty(address.cityOfResidence);
    final String? residenceAddressError = ValidationService.notEmpty(address.residenceAddress);
    final String? citizenshipError = ValidationService.notEmpty(address.citizenship);

    // Passport
    final PassportSubState passport = state.passport;
    final String? passportSeriesError = ValidationService.notEmpty(passport.passportSeries);
    final String? passportNumberError = ValidationService.notEmpty(passport.passportNumber);
    final String? idNumberError = ValidationService.notEmpty(passport.idNumber);
    final String? issuingError = ValidationService.notEmpty(passport.issuing);
    final String? issuingDateError = ValidationService.notEmptyDateTime(passport.issuingDate);

    // Contacts
    final ContactsSubState contacts = state.contacts;
    // final String? emailError = ValidationService.validateEmail(contacts.email);
    const String? emailError = null;

    // Employment
    final EmploymentSubState employment = state.employment;
    final String? positionError = ValidationService.notEmpty(employment.position);
    final String? placeOfWorkError = ValidationService.notEmpty(employment.placeOfWork);
    final String? monthlyIncomeError = ValidationService.notEmptyInt(employment.monthlyIncome);
    final String? retireeError = ValidationService.notEmptyBool(employment.retiree);

    // Misc
    final MiscSubState misc = state.misc;
    final String? familyStatusError = ValidationService.notEmptyFamilyStatus(misc.familyStatus);

    final bool noErrors = compareAllTo(<String?>[
      firstNameError,
      middleNameError,
      lastNameError,
      genderError,
      birthAddressError,
      currentCityError,
      currentAddressError,
      cityOfResidenceError,
      residenceAddressError,
      citizenshipError,
      emailError,
      passportSeriesError,
      passportNumberError,
      idNumberError,
      issuingError,
      issuingDateError,
      idNumberError,
      positionError,
      placeOfWorkError,
      monthlyIncomeError,
      retireeError,
      familyStatusError,
    ], null);

    emit(state.copyWithErrors(
      serverError: '',
      firstNameError: firstNameError,
      middleNameError: middleNameError,
      lastNameError: lastNameError,
      genderError: genderError,
      birthAddressError: birthAddressError,
      currentCityError: currentCityError,
      currentAddressError: currentAddressError,
      cityOfResidenceError: cityOfResidenceError,
      residenceAddressError: residenceAddressError,
      citizenshipError: citizenshipError,
      emailError: emailError,
      passportSeriesError: passportSeriesError,
      passportNumberError: passportNumberError,
      idNumberError: idNumberError,
      issuingError: issuingError,
      issuingDateError: issuingDateError,
      positionError: positionError,
      placeOfWorkError: placeOfWorkError,
      monthlyIncomeError: monthlyIncomeError,
      retireeError: retireeError,
      familyStatusError: familyStatusError,
    ));

    if (noErrors) {
      final ClientDTO dto = ClientDTO(
        firstName: personal.firstName,
        middleName: personal.middleName,
        lastName: personal.lastName,
        gender: personal.gender!,
        birthAddress: address.birthAddress,
        currentCity: address.currentCity,
        currentAddress: address.currentAddress,
        cityOfResidence: address.cityOfResidence,
        residenceAddress: address.residenceAddress,
        citizenship: address.citizenship,
        passportSeries: passport.passportSeries,
        passportNumber: passport.passportNumber,
        idNumber: passport.idNumber,
        issuing: passport.issuing,
        issuingDate: passport.issuingDate!,
        homeNumber: contacts.homeNumber.nullIfEmpty,
        mobileNumber: contacts.mobileNumber.nullIfEmpty,
        email: contacts.email.nullIfEmpty,
        position: employment.position.nullIfEmpty,
        placeOfWork: employment.placeOfWork.nullIfEmpty,
        monthlyIncome: employment.monthlyIncome!,
        retiree: employment.retiree!,
        familyStatus: misc.familyStatus!,
        disability: misc.disability,
        conscription: misc.conscription,
      );

      final int? id = state.id;

      try {
        final Client client = id != null
            ? await _updateClientUseCase.execute((
                id: id,
                data: dto,
              ))
            : await _createClientUseCase.execute(dto);

        _appRouter.pop<Client?>(client);
      } catch (_) {
        emit(state.copyWith(
          serverError: LocaleKeys.clients_errors_serverError.translate(),
        ));
      }
    }
  }
}
