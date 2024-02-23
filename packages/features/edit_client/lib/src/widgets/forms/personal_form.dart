import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../bloc/edit_client_bloc.dart';
import '../../bloc/substates/personal_substate.dart';
import '../input_table_cell.dart';
import '../key_table_cell.dart';

class PersonalForm extends StatelessWidget {
  const PersonalForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditClientBloc bloc = context.read<EditClientBloc>();

    return BlocBuilder<EditClientBloc, EditClientState>(
      buildWhen: (EditClientState prev, EditClientState curr) => prev.didPersonalChanged(curr),
      builder: (BuildContext context, EditClientState state) {
        final PersonalSubState personal = state.personal;

        return Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.clients_labels_firstName.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: personal.firstName,
                    onChanged: (String value) => bloc.add(UpdatePersonal(firstName: value)),
                    error: personal.firstNameError,
                    formatters: <TextInputFormatter>[
                      NameInputFormatter(),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.clients_labels_middleName.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: personal.middleName,
                    onChanged: (String value) => bloc.add(UpdatePersonal(middleName: value)),
                    error: personal.middleNameError,
                    formatters: <TextInputFormatter>[
                      NameInputFormatter(),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.clients_labels_lastName.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: personal.lastName,
                    onChanged: (String value) => bloc.add(UpdatePersonal(lastName: value)),
                    error: personal.lastNameError,
                    formatters: <TextInputFormatter>[
                      NameInputFormatter(),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.clients_labels_gender.translate()),
                InputTableCell(
                  child: TableDropDown<Gender>(
                    values: Gender.values,
                    value: personal.gender,
                    stringifier: (Gender item) => item.localeKey.translate(),
                    onChanged: (Gender? value) => bloc.add(UpdatePersonal(gender: value)),
                    error: personal.genderError,
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
