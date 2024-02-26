part of 'deposit_bloc.dart';

class DepositState {
  final List<Client> clients;
  final int clientIndex;

  final List<Deposit> deposits;
  final int depositIndex;

  Client? get selectedClient => clientIndex != -1 ? clients[clientIndex] : null;

  Deposit? get selectedDeposit => selectedClient != null && depositIndex != -1 ? deposits[depositIndex] : null;

  const DepositState.initial()
      : clients = const <Client>[],
        clientIndex = -1,
        deposits = const <Deposit>[],
        depositIndex = -1;

  const DepositState({
    required this.clients,
    required this.clientIndex,
    required this.deposits,
    required this.depositIndex,
  });

  DepositState copyWith({
    List<Client>? clients,
    int? clientIndex,
    List<Deposit>? deposits,
    int? depositIndex,
  }) {
    return DepositState(
      clients: clients ?? this.clients,
      clientIndex: clientIndex ?? this.clientIndex,
      deposits: deposits ?? this.deposits,
      depositIndex: depositIndex ?? this.depositIndex,
    );
  }
}
