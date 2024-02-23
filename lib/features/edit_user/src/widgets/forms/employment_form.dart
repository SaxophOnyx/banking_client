import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/features/edit_user/src/bloc/edit_user_bloc.dart';
import 'package:banking_client/features/edit_user/src/bloc/substates/employment_substate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../input_table_cell.dart';
import '../key_table_cell.dart';

class EmploymentForm extends StatelessWidget {
  const EmploymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditUserBloc bloc = context.read<EditUserBloc>();

    return BlocBuilder<EditUserBloc, EditUserState>(
      buildWhen: (EditUserState prev, EditUserState curr) => prev.didEmploymentChanged(curr),
      builder: (BuildContext context, EditUserState state) {
        final EmploymentSubState employment = state.employment;

        return Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_position.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: employment.position,
                    onChanged: (String value) => bloc.add(UpdateEmployment(position: value)),
                    error: employment.positionError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_placeOfWork.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: employment.placeOfWork,
                    onChanged: (String value) => bloc.add(UpdateEmployment(placeOfWork: value)),
                    error: employment.placeOfWorkError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_monthlyIncome.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: employment.monthlyIncome?.toString() ?? '',
                    onChanged: (String value) => bloc.add(
                      UpdateEmployment(monthlyIncome: NullOrInt(int.tryParse(value))),
                    ),
                    error: employment.monthlyIncomeError,
                    formatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_retiree.translate()),
                InputTableCell(
                  child: TableBooleanPicker(
                    value: employment.retiree,
                    onChanged: (bool? value) => bloc.add(UpdateEmployment(retiree: value)),
                    error: employment.retireeError,
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
