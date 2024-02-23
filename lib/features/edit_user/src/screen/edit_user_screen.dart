import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/edit_user_bloc.dart';
import 'edit_user_content.dart';

@RoutePage<User>()
class EditUserScreen extends StatelessWidget {
  final User? initialData;

  const EditUserScreen({
    super.key,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditUserBloc>(
      lazy: false,
      create: (_) => EditUserBloc(
        appRouter: appDi.get<AppRouter>(),
        createUserUseCase: appDi.get<CreateUserUseCase>(),
        updateUserUseCase: appDi.get<UpdateUserUseCase>(),
        initialData: initialData,
      ),
      child: const EditUserContent(),
    );
  }
}
