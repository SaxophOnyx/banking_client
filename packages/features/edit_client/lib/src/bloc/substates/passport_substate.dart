import 'package:domain/domain.dart';

class PassportSubState {
  final String passportSeries;
  final String passportNumber;
  final String idNumber;
  final String issuing;
  final DateTime? issuingDate;

  final String passportSeriesError;
  final String passportNumberError;
  final String idNumberError;
  final String issuingError;
  final String issuingDateError;

  const PassportSubState({
    required this.passportSeries,
    required this.passportSeriesError,
    required this.passportNumber,
    required this.passportNumberError,
    required this.idNumber,
    required this.idNumberError,
    required this.issuing,
    required this.issuingError,
    required this.issuingDate,
    required this.issuingDateError,
  });

  const PassportSubState.empty()
      : passportSeries = '',
        passportSeriesError = '',
        passportNumber = '',
        passportNumberError = '',
        idNumber = '',
        idNumberError = '',
        issuing = '',
        issuingError = '',
        issuingDate = null,
        issuingDateError = '';

  PassportSubState.fromClient(Client client)
      : passportSeries = client.passportSeries,
        passportSeriesError = '',
        passportNumber = client.passportNumber,
        passportNumberError = '',
        idNumber = client.idNumber,
        idNumberError = '',
        issuing = client.issuing,
        issuingError = '',
        issuingDate = client.issuingDate,
        issuingDateError = '';

  PassportSubState copyWith({
    String? passportSeries,
    String? passportNumber,
    String? issuing,
    DateTime? issuingDate,
    String? passportSeriesError,
    String? passportNumberError,
    String? idNumber,
    String? idNumberError,
    String? issuingError,
    String? issuingDateError,
  }) {
    return PassportSubState(
      passportSeries: passportSeries ?? this.passportSeries,
      passportSeriesError: passportSeriesError ?? this.passportSeriesError,
      passportNumber: passportNumber ?? this.passportNumber,
      passportNumberError: passportNumberError ?? this.passportNumberError,
      idNumber: idNumber ?? this.idNumber,
      idNumberError: idNumberError ?? this.idNumberError,
      issuing: issuing ?? this.issuing,
      issuingError: issuingError ?? this.issuingError,
      issuingDate: issuingDate ?? this.issuingDate,
      issuingDateError: issuingDateError ?? this.issuingDateError,
    );
  }
}
