part of 'users_bloc.dart';

class UsersState {
  final LoadingStatus loadingStatus;
  final List<User> users;
  final int index;

  bool get isLoading => loadingStatus == LoadingStatus.inProgress;

  User? get selectedUser => index == -1 ? null : users[index];

  const UsersState.initial()
      : loadingStatus = LoadingStatus.inProgress,
        users = const <User>[],
        index = -1;

  const UsersState({
    required this.loadingStatus,
    required this.users,
    required this.index,
  });

  UsersState copyWith({
    LoadingStatus? loadingStatus,
    List<User>? users,
    int? index,
  }) {
    return UsersState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      users: users ?? this.users,
      index: index ?? this.index,
    );
  }
}
