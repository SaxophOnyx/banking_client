import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/features/edit_client/edit_client.dart' as ec;
import 'package:banking_client/navigation/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'clients_events.dart';
part 'clients_state.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  final AppRouter _appRouter;
  final GetClientsUseCase _getClientsUseCase;

  ClientsBloc({
    required AppRouter appRouter,
    required GetClientsUseCase getClientsUseCase,
  })  : _appRouter = appRouter,
        _getClientsUseCase = getClientsUseCase,
        super(const ClientsState.initial()) {
    on<LoadData>(_onLoadData);
    on<SelectedClientChanged>(_onSelectedClientChanged);
    on<CreateClientPressed>(_onCreateClientPressed);
    on<EditClientPressed>(_onEditClientPressed);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<ClientsState> emit,
  ) async {
    final List<Client> clients = await _getClientsUseCase.execute();

    emit(state.copyWith(
      loadingStatus: LoadingStatus.success,
      clients: clients,
    ));
  }

  Future<void> _onSelectedClientChanged(
    SelectedClientChanged event,
    Emitter<ClientsState> emit,
  ) async {
    emit(state.copyWith(
      index: event.index,
    ));
  }

  Future<void> _onCreateClientPressed(
    CreateClientPressed event,
    Emitter<ClientsState> emit,
  ) async {
    final Client? client = await _appRouter.push(ec.EditClientRoute());

    if (client != null) {
      final List<Client> clients = <Client>[
        ...state.clients,
        ...<Client>[client],
      ];

      emit(state.copyWith(
        clients: clients,
        index: -1,
      ));
    }
  }

  Future<void> _onEditClientPressed(
    EditClientPressed event,
    Emitter<ClientsState> emit,
  ) async {
    final int index = event.index ?? state.index;

    if (index != -1) {
      final Client currentClient = state.clients[index];
      final Client? client = await _appRouter.push(ec.EditClientRoute(initialData: currentClient));

      if (client != null) {
        final List<Client> old = state.clients;
        final List<Client> clients = <Client>[
          ...old.sublist(0, index),
          ...<Client>[client],
          ...old.sublist(index + 1),
        ];

        emit(state.copyWith(
          clients: clients,
          index: -1,
        ));
      }
    }
  }
}
