part of 'users_bloc.dart';

abstract class UsersEvent {
  const UsersEvent();
}

class LoadData extends UsersEvent {
  const LoadData();
}

class SelectedUserChanged extends UsersEvent {
  final int index;

  const SelectedUserChanged(this.index);
}

class CreateUserPressed extends UsersEvent {
  const CreateUserPressed();
}

class EditUserPressed extends UsersEvent {
  final int? index;

  const EditUserPressed([this.index]);
}
