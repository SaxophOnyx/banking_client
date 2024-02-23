part of 'clients_bloc.dart';

abstract class ClientsEvent {
  const ClientsEvent();
}

class LoadData extends ClientsEvent {
  const LoadData();
}

class SelectedClientChanged extends ClientsEvent {
  final int index;

  const SelectedClientChanged(this.index);
}

class CreateClientPressed extends ClientsEvent {
  const CreateClientPressed();
}

class EditClientPressed extends ClientsEvent {
  final int? index;

  const EditClientPressed([this.index]);
}
