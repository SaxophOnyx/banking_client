import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
