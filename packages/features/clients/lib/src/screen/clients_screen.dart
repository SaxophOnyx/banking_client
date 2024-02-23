import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/clients_bloc.dart';
import 'clients_content.dart';

@RoutePage()
class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientsBloc>(
      lazy: false,
      create: (_) => ClientsBloc(
        appRouter: appDi.get<AppRouter>(),
        getClientsUseCase: appDi.get<GetClientsUseCase>(),
      )..add(const LoadData()),
      child: const ClientsContent(),
    );
  }
}
