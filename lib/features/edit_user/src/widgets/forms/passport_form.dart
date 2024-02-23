import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/edit_user_bloc.dart';
import '../../bloc/substates/passport_substate.dart';
import '../input_table_cell.dart';
import '../key_table_cell.dart';

class PassportForm extends StatelessWidget {
  const PassportForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditUserBloc bloc = context.read<EditUserBloc>();

    return BlocBuilder<EditUserBloc, EditUserState>(
      buildWhen: (EditUserState prev, EditUserState curr) => prev.didPassportChanged(curr),
      builder: (BuildContext context, EditUserState state) {
        final PassportSubState passport = state.passport;

        return Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_passwordSeries.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: passport.passportSeries,
                    onChanged: (String value) => bloc.add(UpdatePassport(passportSeries: value)),
                    error: passport.passportSeriesError,
                    formatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+')),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_passwordNumber.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: passport.passportNumber,
                    onChanged: (String value) => bloc.add(UpdatePassport(passportNumber: value)),
                    error: passport.passportNumberError,
                    formatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_idNumber.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: passport.idNumber,
                    onChanged: (String value) => bloc.add(UpdatePassport(idNumber: value)),
                    error: passport.idNumberError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_issuing.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: passport.issuing,
                    onChanged: (String value) => bloc.add(UpdatePassport(issuing: value)),
                    error: passport.issuingError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_issuingDate.translate()),
                InputTableCell(
                  child: TableDatePicker(
                    value: passport.issuingDate,
                    onChange: (DateTime date) => bloc.add(UpdatePassport(issuingDate: date)),
                    error: passport.issuingDateError,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
