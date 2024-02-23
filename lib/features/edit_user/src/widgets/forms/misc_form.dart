import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/features/edit_user/src/bloc/edit_user_bloc.dart';
import 'package:banking_client/features/edit_user/src/bloc/substates/misc_substate.dart';
import 'package:banking_client/features/edit_user/src/widgets/input_table_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../key_table_cell.dart';

class MiscForm extends StatelessWidget {
  const MiscForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditUserBloc bloc = context.read<EditUserBloc>();

    return BlocBuilder<EditUserBloc, EditUserState>(
      buildWhen: (EditUserState prev, EditUserState curr) => prev.didMiscChanged(curr),
      builder: (BuildContext context, EditUserState state) {
        final MiscSubState misc = state.misc;

        return Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_familyStatus.translate()),
                InputTableCell(
                  child: TableDropDown<FamilyStatus>(
                    values: FamilyStatus.values,
                    value: misc.familyStatus,
                    stringifier: (FamilyStatus item) => item.name,
                    onChanged: (FamilyStatus? value) => bloc.add(UpdateMisc(familyStatus: value)),
                    error: misc.familyStatusError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_disability.translate()),
                InputTableCell(
                  child: TableDropDown<Disability>(
                    values: Disability.values,
                    value: misc.disability,
                    stringifier: (Disability item) => item.name,
                    onChanged: (Disability? value) => bloc.add(UpdateMisc(disability: (value))),
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_conscription.translate()),
                InputTableCell(
                  child: TableBooleanPicker(
                    value: misc.conscription,
                    onChanged: (bool? value) => bloc.add(UpdateMisc(conscription: value)),
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
