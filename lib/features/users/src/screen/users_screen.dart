import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/users_bloc.dart';
import 'users_content.dart';

@RoutePage()
class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersBloc>(
      lazy: false,
      create: (_) => UsersBloc(
        appRouter: appDi.get<AppRouter>(),
        getUsersUseCase: appDi.get<GetUsersUseCase>(),
      )..add(const LoadData()),
      child: const UsersContent(),
    );
  }
}
