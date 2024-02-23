import 'package:banking_client/domain/domain.dart';

class AddressSubState {
  final String birthAddress;
  final String currentCity;
  final String currentAddress;
  final String cityOfResidence;
  final String residenceAddress;
  final String citizenship;

  final String birthAddressError;
  final String currentCityError;
  final String currentAddressError;
  final String cityOfResidenceError;
  final String residenceAddressError;
  final String citizenshipError;

  const AddressSubState({
    required this.birthAddress,
    required this.currentCity,
    required this.currentAddress,
    required this.cityOfResidence,
    required this.residenceAddress,
    required this.citizenship,
    required this.birthAddressError,
    required this.currentCityError,
    required this.currentAddressError,
    required this.cityOfResidenceError,
    required this.citizenshipError,
    required this.residenceAddressError,
  });

  const AddressSubState.empty()
      : birthAddress = '',
        currentCity = '',
        currentAddress = '',
        cityOfResidence = '',
        residenceAddress = '',
        citizenship = '',
        birthAddressError = '',
        currentCityError = '',
        currentAddressError = '',
        cityOfResidenceError = '',
        residenceAddressError = '',
        citizenshipError = '';

  AddressSubState.fromUser(User user)
      : birthAddress = user.birthAddress,
        currentCity = user.currentCity,
        currentAddress = user.currentAddress,
        cityOfResidence = user.cityOfResidence,
        residenceAddress = user.residenceAddress,
        citizenship = user.citizenship,
        birthAddressError = '',
        currentCityError = '',
        currentAddressError = '',
        cityOfResidenceError = '',
        residenceAddressError = '',
        citizenshipError = '';

  AddressSubState copyWith({
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
    return AddressSubState(
      birthAddress: birthAddress ?? this.birthAddress,
      currentCity: currentCity ?? this.currentCity,
      currentAddress: currentAddress ?? this.currentAddress,
      cityOfResidence: cityOfResidence ?? this.cityOfResidence,
      residenceAddress: residenceAddress ?? this.residenceAddress,
      citizenship: citizenship ?? this.citizenship,
      birthAddressError: birthAddressError ?? this.birthAddressError,
      currentCityError: currentCityError ?? this.currentCityError,
      currentAddressError: currentAddressError ?? this.currentAddressError,
      cityOfResidenceError: cityOfResidenceError ?? this.cityOfResidenceError,
      residenceAddressError: residenceAddressError ?? this.residenceAddressError,
      citizenshipError: citizenshipError ?? this.citizenshipError,
    );
  }
}
