import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'account_table.dart';
import 'deposit_table.dart';

class DepositDetails extends StatelessWidget {
  final Deposit? deposit;

  const DepositDetails({
    super.key,
    required this.deposit,
  });

  @override
  Widget build(BuildContext context) {
    final Deposit? maybeDeposit = deposit;

    const double depositSpacer = 40;

    return DecoratedContainer(
      label: LocaleKeys.deposit_depositDetails.translate(),
      child: maybeDeposit == null
          ? EmptyContainerContent(
              text: LocaleKeys.deposit_noDepositSelected.translate(),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  DepositTable(deposit: maybeDeposit),
                  const SizedBox(height: depositSpacer),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: maybeDeposit.accounts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Account account = maybeDeposit.accounts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: depositSpacer),
                        child: AccountTable(account: account),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: depositSpacer),
                  ),
                  const SizedBox(height: depositSpacer),
                ],
              ),
            ),
    );
  }
}
