import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/edit_client_bloc.dart';
import 'edit_client_content.dart';

@RoutePage<Client>()
class EditClientScreen extends StatelessWidget {
  final Client? initialData;

  const EditClientScreen({
    super.key,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditClientBloc>(
      lazy: false,
      create: (_) => EditClientBloc(
        appRouter: appDi.get<AppRouter>(),
        createClientUseCase: appDi.get<CreateClientUseCase>(),
        updateClientUseCase: appDi.get<UpdateClientUseCase>(),
        initialData: initialData,
      ),
      child: const EditClientContent(),
    );
  }
}
