import 'package:banking_client/domain/domain.dart';

class ContactsSubState {
  final String homeNumber;
  final String mobileNumber;
  final String email;

  final String homeNumberError;
  final String mobileNumberError;
  final String emailError;

  const ContactsSubState({
    required this.homeNumber,
    required this.homeNumberError,
    required this.mobileNumber,
    required this.mobileNumberError,
    required this.email,
    required this.emailError,
  });

  const ContactsSubState.empty()
      : homeNumber = '',
        homeNumberError = '',
        mobileNumber = '',
        mobileNumberError = '',
        email = '',
        emailError = '';

  ContactsSubState.fromUser(User user)
      : homeNumber = user.homeNumber ?? '',
        homeNumberError = '',
        mobileNumber = user.mobileNumber ?? '',
        mobileNumberError = '',
        email = user.email ?? '',
        emailError = '';

  ContactsSubState copyWith({
    String? homeNumber,
    String? mobileNumber,
    String? email,
    String? homeNumberError,
    String? mobileNumberError,
    String? emailError,
  }) {
    return ContactsSubState(
      homeNumber: homeNumber ?? this.homeNumber,
      homeNumberError: homeNumberError ?? this.homeNumberError,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      mobileNumberError: mobileNumberError ?? this.mobileNumberError,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
    );
  }
}
