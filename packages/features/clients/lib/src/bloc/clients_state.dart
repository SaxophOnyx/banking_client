part of 'clients_bloc.dart';

class ClientsState {
  final LoadingStatus loadingStatus;
  final List<Client> clients;
  final int index;

  bool get isLoading => loadingStatus == LoadingStatus.inProgress;

  Client? get selectedClient => index == -1 ? null : clients[index];

  const ClientsState.initial()
      : loadingStatus = LoadingStatus.inProgress,
        clients = const <Client>[],
        index = -1;

  const ClientsState({
    required this.loadingStatus,
    required this.clients,
    required this.index,
  });

  ClientsState copyWith({
    LoadingStatus? loadingStatus,
    List<Client>? clients,
    int? index,
  }) {
    return ClientsState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      clients: clients ?? this.clients,
      index: index ?? this.index,
    );
  }
}
