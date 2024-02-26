import 'dart:async';

import 'package:core_ui/core_ui.dart';
import 'package:deposit_agreement/deposit_agreement.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'deposit_events.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final AppRouter _appRouter;
  final GetClientsUseCase _getClientsUseCase;
  final ObserveClientsUseCase _observeClientsUseCase;
  final GetDepositsByClientIdUseCase _getDepositsByClientIdUseCase;
  final CloseBankDayUseCase _closeBankDayUseCase;

  late final StreamSubscription<ItemNotification<Client>> _clientSubscription;

  DepositBloc({
    required AppRouter appRouter,
    required GetClientsUseCase getClientsUseCase,
    required ObserveClientsUseCase observeClientsUseCase,
    required GetDepositsByClientIdUseCase getDepositsByClientIdUseCase,
    required CloseBankDayUseCase closeBankDayUseCase,
  })  : _appRouter = appRouter,
        _getClientsUseCase = getClientsUseCase,
        _observeClientsUseCase = observeClientsUseCase,
        _getDepositsByClientIdUseCase = getDepositsByClientIdUseCase,
        _closeBankDayUseCase = closeBankDayUseCase,
        super(const DepositState.initial()) {
    on<Initialize>(_onInitialize);
    on<ClientUpdated>(_onClientUpdated);
    on<SelectedClientChanged>(_onSelectedClientChanged);
    on<SelectedDepositChanged>(_onSelectedDepositChanged);
    on<SignAgreementPressed>(_onSignAgreementPressed);
    on<CloseBankDay>(_onCloseBankDay);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<DepositState> emit,
  ) async {
    final List<Client> clients = await _getClientsUseCase.execute();

    _clientSubscription = _observeClientsUseCase
        .execute()
        .listen((ItemNotification<Client> notification) => add(ClientUpdated(notification)));

    emit(state.copyWith(
      clients: clients,
    ));
  }

  void _onClientUpdated(
    ClientUpdated event,
    Emitter<DepositState> emit,
  ) {
    final bool isCreated = event.notification.isCreated;
    final Client client = event.notification.item;
    final List<Client> clients = List<Client>.from(state.clients, growable: true);

    if (isCreated) {
      clients.add(client);
    } else {
      final int index = clients.indexWhere((Client c) => c.id == client.id);
      clients[index] = client;
    }

    emit(state.copyWith(
      clients: clients,
      clientIndex: -1,
      depositIndex: -1,
    ));
  }

  Future<void> _onSelectedClientChanged(
    SelectedClientChanged event,
    Emitter<DepositState> emit,
  ) async {
    final int newIndex = event.clientIndex;
    final Client newClient = state.clients[newIndex];
    final List<Deposit> newDeposits = await _getDepositsByClientIdUseCase.execute(newClient.id);

    emit(state.copyWith(
      clientIndex: newIndex,
      deposits: newDeposits,
      depositIndex: -1,
    ));
  }

  void _onSelectedDepositChanged(
    SelectedDepositChanged event,
    Emitter<DepositState> emit,
  ) {
    emit(state.copyWith(
      depositIndex: event.depositIndex,
    ));
  }

  Future<void> _onSignAgreementPressed(
    SignAgreementPressed event,
    Emitter<DepositState> emit,
  ) async {
    final Client? client = state.selectedClient;

    if (client != null) {
      final Deposit? deposit = await _appRouter.push<Deposit>(DepositAgreementRoute(clientId: client.id));

      if (deposit != null) {
        final List<Deposit> deposits = List<Deposit>.from(state.deposits, growable: true);
        deposits.add(deposit);

        emit(state.copyWith(
          deposits: deposits,
        ));
      }
    }
  }

  Future<void> _onCloseBankDay(
    CloseBankDay event,
    Emitter<DepositState> emit,
  ) async {}

  @override
  Future<void> close() async {
    await _clientSubscription.cancel();
    super.close();
  }
}
