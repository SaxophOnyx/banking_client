import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/features/edit_user/src/bloc/edit_user_bloc.dart';
import 'package:banking_client/features/edit_user/src/bloc/substates/personal_substate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../input_table_cell.dart';
import '../key_table_cell.dart';

class PersonalForm extends StatelessWidget {
  const PersonalForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditUserBloc bloc = context.read<EditUserBloc>();

    return BlocBuilder<EditUserBloc, EditUserState>(
      buildWhen: (EditUserState prev, EditUserState curr) => prev.didPersonalChanged(curr),
      builder: (BuildContext context, EditUserState state) {
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
                KeyTableCell(value: LocaleKeys.users_labels_firstName.translate()),
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
                KeyTableCell(value: LocaleKeys.users_labels_middleName.translate()),
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
                KeyTableCell(value: LocaleKeys.users_labels_lastName.translate()),
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
                KeyTableCell(value: LocaleKeys.users_labels_gender.translate()),
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
