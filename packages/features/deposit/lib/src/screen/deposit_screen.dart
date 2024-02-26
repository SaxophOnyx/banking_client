import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/deposit_bloc.dart';
import 'deposit_content.dart';

@RoutePage()
class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DepositBloc>(
      lazy: false,
      create: (_) => DepositBloc(
        appRouter: appDi.get<AppRouter>(),
        getClientsUseCase: appDi.get<GetClientsUseCase>(),
        observeClientsUseCase: appDi.get<ObserveClientsUseCase>(),
        getDepositsByClientIdUseCase: appDi.get<GetDepositsByClientIdUseCase>(),
        closeBankDayUseCase: appDi.get<CloseBankDayUseCase>(),
      )..add(const Initialize()),
      child: const DepositContent(),
    );
  }
}
