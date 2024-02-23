import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/features/edit_user/edit_user.dart' as eu;
import 'package:banking_client/navigation/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_events.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final AppRouter _appRouter;
  final GetUsersUseCase _getUsersUseCase;

  UsersBloc({
    required AppRouter appRouter,
    required GetUsersUseCase getUsersUseCase,
  })  : _appRouter = appRouter,
        _getUsersUseCase = getUsersUseCase,
        super(const UsersState.initial()) {
    on<LoadData>(_onLoadData);
    on<SelectedUserChanged>(_onSelectedUserChanged);
    on<CreateUserPressed>(_onCreateUserPressed);
    on<EditUserPressed>(_onEditUserPressed);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<UsersState> emit,
  ) async {
    final List<User> users = await _getUsersUseCase.execute();

    emit(state.copyWith(
      loadingStatus: LoadingStatus.success,
      users: users,
    ));
  }

  Future<void> _onSelectedUserChanged(
    SelectedUserChanged event,
    Emitter<UsersState> emit,
  ) async {
    emit(state.copyWith(
      index: event.index,
    ));
  }

  Future<void> _onCreateUserPressed(
    CreateUserPressed event,
    Emitter<UsersState> emit,
  ) async {
    final User? user = await _appRouter.push(eu.EditUserRoute());

    if (user != null) {
      final List<User> users = <User>[
        ...state.users,
        ...<User>[user],
      ];

      emit(state.copyWith(
        users: users,
        index: -1,
      ));
    }
  }

  Future<void> _onEditUserPressed(
    EditUserPressed event,
    Emitter<UsersState> emit,
  ) async {
    final int index = event.index ?? state.index;

    if (index != -1) {
      final User currentUser = state.users[index];
      final User? user = await _appRouter.push(eu.EditUserRoute(initialData: currentUser));

      if (user != null) {
        final List<User> old = state.users;
        final List<User> users = <User>[
          ...old.sublist(0, index),
          ...<User>[user],
          ...old.sublist(index + 1),
        ];

        emit(state.copyWith(
          users: users,
          index: -1,
        ));
      }
    }
  }
}
