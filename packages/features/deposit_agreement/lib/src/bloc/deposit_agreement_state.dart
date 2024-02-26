part of 'deposit_agreement_bloc.dart';

class DepositAgreementState {
  final String clientId;

  final DepositType? depositType;
  final String agreementNumber;
  final DateTime? agreementBegin;
  final DateTime? agreementEnd;
  final BigInt? amount;
  final int? interest;

  final String depositTypeError;
  final String agreementNumberError;
  final String agreementBeginError;
  final String agreementEndError;
  final String amountError;
  final String interestError;
  final String agreementsDatesMismatchError;

  String get agreementEndErrorDisplayError =>
      agreementEndError.isNotEmpty ? agreementEndError : agreementsDatesMismatchError;

  const DepositAgreementState({
    required this.clientId,
    required this.depositType,
    required this.depositTypeError,
    required this.agreementNumber,
    required this.agreementNumberError,
    required this.agreementBegin,
    required this.agreementBeginError,
    required this.agreementEnd,
    required this.agreementEndError,
    required this.amount,
    required this.amountError,
    required this.interest,
    required this.interestError,
    required this.agreementsDatesMismatchError,
  });

  const DepositAgreementState.initial({required this.clientId})
      : depositType = null,
        depositTypeError = '',
        agreementNumber = '',
        agreementNumberError = '',
        agreementBegin = null,
        agreementBeginError = '',
        agreementEnd = null,
        agreementEndError = '',
        amount = null,
        amountError = '',
        interest = null,
        interestError = '',
        agreementsDatesMismatchError = '';

  DepositAgreementState copyWith({
    DepositType? depositType,
    String? agreementNumber,
    DateTime? agreementBegin,
    DateTime? agreementEnd,
    NullOrBigInt? amount,
    NullOrInt? interest,
    String? depositTypeError,
    String? agreementNumberError,
    String? agreementBeginError,
    String? agreementEndError,
    String? amountError,
    String? interestError,
    String? agreementsDatesMismatchError,
  }) {
    return DepositAgreementState(
      clientId: clientId,
      depositType: depositType ?? this.depositType,
      depositTypeError: depositTypeError ?? this.depositTypeError,
      agreementNumber: agreementNumber ?? this.agreementNumber,
      agreementNumberError: agreementNumberError ?? this.agreementNumberError,
      agreementBegin: agreementBegin ?? this.agreementBegin,
      agreementBeginError: agreementBeginError ?? this.agreementBeginError,
      agreementEnd: agreementEnd ?? this.agreementEnd,
      agreementEndError: agreementEndError ?? this.agreementEndError,
      amount: amount != null ? amount.value : this.amount,
      amountError: amountError ?? this.amountError,
      interest: interest != null ? interest.value : this.interest,
      interestError: interestError ?? this.interestError,
      agreementsDatesMismatchError: agreementsDatesMismatchError ?? this.agreementsDatesMismatchError,
    );
  }
}
