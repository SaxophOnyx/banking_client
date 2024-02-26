part of 'deposit_agreement_bloc.dart';

abstract class DepositAgreementEvent {
  const DepositAgreementEvent();
}

class UpdateDepositType extends DepositAgreementEvent {
  final DepositType? depositType;

  const UpdateDepositType(this.depositType);
}

class UpdateAgreementNumber extends DepositAgreementEvent {
  final String agreementNumber;

  const UpdateAgreementNumber(this.agreementNumber);
}

class UpdateAgreementDates extends DepositAgreementEvent {
  final DateTime? begin;
  final DateTime? end;

  const UpdateAgreementDates({this.begin, this.end});
}

class UpdateAmount extends DepositAgreementEvent {
  final BigInt? amount;

  const UpdateAmount(this.amount);
}

class UpdateInterest extends DepositAgreementEvent {
  final int? interest;

  const UpdateInterest(this.interest);
}

class SubmitForm extends DepositAgreementEvent {
  const SubmitForm();
}
