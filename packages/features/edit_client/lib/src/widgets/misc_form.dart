import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/edit_client_bloc.dart';
import '../bloc/substates/misc_substate.dart';

class MiscForm extends StatelessWidget {
  const MiscForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditClientBloc bloc = context.read<EditClientBloc>();

    return BlocBuilder<EditClientBloc, EditClientState>(
      buildWhen: (EditClientState prev, EditClientState curr) => prev.didMiscChanged(curr),
      builder: (BuildContext context, EditClientState state) {
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
                InputKeyTableCell(value: LocaleKeys.clients_labels_familyStatus.translate()),
                InputValueTableCell(
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
                InputKeyTableCell(value: LocaleKeys.clients_labels_disability.translate()),
                InputValueTableCell(
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
                InputKeyTableCell(value: LocaleKeys.clients_labels_conscription.translate()),
                InputValueTableCell(
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
