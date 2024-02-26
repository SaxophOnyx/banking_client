import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AccountTable extends StatelessWidget {
  final Account account;

  const AccountTable({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return DisplayTableBase(
      fullBorder: true,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_account_labels_id.translate()),
            DisplayValueTableCell(value: account.id.toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_account_labels_name.translate()),
            DisplayValueTableCell(value: account.name),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_account_labels_depositId.translate()),
            DisplayValueTableCell(value: account.depositId.toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_account_labels_number.translate()),
            DisplayValueTableCell(value: account.number.toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_account_labels_activity.translate()),
            DisplayValueTableCell(value: account.activity),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_account_labels_debit.translate()),
            DisplayValueTableCell(value: account.debit.toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_account_labels_credit.translate()),
            DisplayValueTableCell(value: account.credit.toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_account_labels_balance.translate()),
            DisplayValueTableCell(value: account.balance.toString()),
          ],
        ),
      ],
    );
  }
}
