import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/deposit_agreement_bloc.dart';
import 'deposit_agreement_content.dart';

@RoutePage<Deposit>()
class DepositAgreementScreen extends StatelessWidget {
  final String clientId;

  const DepositAgreementScreen({
    super.key,
    required this.clientId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DepositAgreementBloc>(
      lazy: false,
      create: (_) => DepositAgreementBloc(
        appRouter: appDi.get<AppRouter>(),
        addDepositUseCase: appDi.get<AddDepositUseCase>(),
        clientId: clientId,
      ),
      child: const DepositAgreementContent(),
    );
  }
}
