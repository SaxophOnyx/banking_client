import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/deposit_bloc.dart';
import '../widgets/client_list.dart';
import '../widgets/deposit_details.dart';
import '../widgets/deposit_list.dart';

class DepositContent extends StatelessWidget {
  const DepositContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double listSpacer = AppDimens.PAGE_CONTENT_PADDING;

    final DepositBloc bloc = context.read<DepositBloc>();

    return PageTemplate(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: BlocBuilder<DepositBloc, DepositState>(
              builder: (BuildContext context, DepositState state) {
                return ClientList(
                  items: state.clients,
                  index: state.clientIndex,
                  onActiveItemChanged: (int index) => bloc.add(SelectedClientChanged(index)),
                );
              },
            ),
          ),
          const SizedBox(width: listSpacer),
          Flexible(
            child: BlocBuilder<DepositBloc, DepositState>(
              builder: (BuildContext context, DepositState state) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: DepositList(
                        client: state.selectedClient,
                        items: state.deposits,
                        index: state.depositIndex,
                        onActiveItemChanged: (int index) => bloc.add(SelectedDepositChanged(index)),
                      ),
                    ),
                    const SizedBox(height: listSpacer),
                    AppButton(
                      isEnabled: state.selectedClient != null,
                      text: LocaleKeys.deposit_newDeposit.translate(),
                      onPressed: () => bloc.add(const SignAgreementPressed()),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(width: listSpacer),
          Expanded(
            flex: 2,
            child: BlocBuilder<DepositBloc, DepositState>(
              builder: (BuildContext context, DepositState state) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: DepositDetails(
                        deposit: state.selectedDeposit,
                      ),
                    ),
                    const SizedBox(height: listSpacer),
                    AppButton(
                      text: LocaleKeys.deposit_closeBankDay.translate(),
                      onPressed: () => bloc.add(const CloseBankDay()),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
