import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class DepositTable extends StatelessWidget {
  final Deposit deposit;

  const DepositTable({
    super.key,
    required this.deposit,
  });

  @override
  Widget build(BuildContext context) {
    return DisplayTableBase(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_id.translate()),
            DisplayValueTableCell(value: deposit.id.toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_clientId.translate()),
            DisplayValueTableCell(value: deposit.clientId.toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_type.translate()),
            DisplayValueTableCell(value: deposit.type.localeKey.translate()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_agreementNumber.translate()),
            DisplayValueTableCell(value: deposit.agreementNumber),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_begin.translate()),
            DisplayValueTableCell(value: DateFormatter.format(deposit.begin)),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_end.translate()),
            DisplayValueTableCell(value: DateFormatter.format(deposit.end)),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_agreementBegin.translate()),
            DisplayValueTableCell(value: DateFormatter.format(deposit.agreementBegin)),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_agreementEnd.translate()),
            DisplayValueTableCell(value: DateFormatter.format(deposit.agreementEnd)),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: LocaleKeys.deposit_labels_amount.translate()),
            DisplayValueTableCell(value: deposit.amount.toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            DisplayKeyTableCell(value: '${LocaleKeys.deposit_labels_interest.translate()}, %'),
            DisplayValueTableCell(value: deposit.interest.toString()),
          ],
        ),
      ],
    );
  }
}
