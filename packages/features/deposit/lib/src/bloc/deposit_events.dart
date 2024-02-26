part of 'deposit_bloc.dart';

abstract class DepositEvent {
  const DepositEvent();
}

class Initialize extends DepositEvent {
  const Initialize();
}

class ClientUpdated extends DepositEvent {
  final ItemNotification<Client> notification;

  const ClientUpdated(this.notification);
}

class SelectedClientChanged extends DepositEvent {
  final int clientIndex;

  const SelectedClientChanged(this.clientIndex);
}

class SelectedDepositChanged extends DepositEvent {
  final int depositIndex;

  const SelectedDepositChanged(this.depositIndex);
}

class SignAgreementPressed extends DepositEvent {
  const SignAgreementPressed();
}

class CloseBankDay extends DepositEvent {
  const CloseBankDay();
}
