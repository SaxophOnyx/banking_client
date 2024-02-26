import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bloc/edit_client_bloc.dart';
import '../bloc/substates/employment_substate.dart';

class EmploymentForm extends StatelessWidget {
  const EmploymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditClientBloc bloc = context.read<EditClientBloc>();

    return BlocBuilder<EditClientBloc, EditClientState>(
      buildWhen: (EditClientState prev, EditClientState curr) => prev.didEmploymentChanged(curr),
      builder: (BuildContext context, EditClientState state) {
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
                InputKeyTableCell(value: LocaleKeys.clients_labels_position.translate()),
                InputValueTableCell(
                  child: DelayedTableTextField(
                    value: employment.position,
                    onChanged: (String value) => bloc.add(UpdateEmployment(position: NullOrString(value))),
                    error: employment.positionError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                InputKeyTableCell(value: LocaleKeys.clients_labels_placeOfWork.translate()),
                InputValueTableCell(
                  child: DelayedTableTextField(
                    value: employment.placeOfWork,
                    onChanged: (String value) => bloc.add(UpdateEmployment(placeOfWork: NullOrString(value))),
                    error: employment.placeOfWorkError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                InputKeyTableCell(value: LocaleKeys.clients_labels_monthlyIncome.translate()),
                InputValueTableCell(
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
                InputKeyTableCell(value: LocaleKeys.clients_labels_retiree.translate()),
                InputValueTableCell(
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
