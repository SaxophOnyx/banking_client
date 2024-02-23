import 'package:banking_client/domain/domain.dart';

class PersonalSubState {
  final String firstName;
  final String middleName;
  final String lastName;
  final Gender? gender;

  final String firstNameError;
  final String middleNameError;
  final String lastNameError;
  final String genderError;

  const PersonalSubState({
    required this.firstName,
    required this.firstNameError,
    required this.middleName,
    required this.middleNameError,
    required this.lastName,
    required this.lastNameError,
    required this.gender,
    required this.genderError,
  });

  const PersonalSubState.empty()
      : firstName = '',
        firstNameError = '',
        middleName = '',
        middleNameError = '',
        lastName = '',
        lastNameError = '',
        gender = null,
        genderError = '';

  PersonalSubState.fromClient(Client client)
      : firstName = client.firstName,
        firstNameError = '',
        middleName = client.middleName,
        middleNameError = '',
        lastName = client.lastName,
        lastNameError = '',
        gender = client.gender,
        genderError = '';

  PersonalSubState copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    Gender? gender,
    String? firstNameError,
    String? middleNameError,
    String? lastNameError,
    String? genderError,
  }) {
    return PersonalSubState(
      firstName: firstName ?? this.firstName,
      firstNameError: firstNameError ?? this.firstNameError,
      middleName: middleName ?? this.middleName,
      middleNameError: middleNameError ?? this.middleNameError,
      lastName: lastName ?? this.lastName,
      lastNameError: lastNameError ?? this.lastNameError,
      gender: gender ?? this.gender,
      genderError: genderError ?? this.genderError,
    );
  }
}
