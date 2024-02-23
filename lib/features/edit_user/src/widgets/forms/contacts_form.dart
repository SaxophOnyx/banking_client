import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/edit_user_bloc.dart';
import '../../bloc/substates/contacts_substate.dart';
import '../input_table_cell.dart';
import '../key_table_cell.dart';

class ContactsForm extends StatelessWidget {
  const ContactsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditUserBloc bloc = context.read<EditUserBloc>();

    return BlocBuilder<EditUserBloc, EditUserState>(
      buildWhen: (EditUserState prev, EditUserState curr) => prev.didContactsChanged(curr),
      builder: (BuildContext context, EditUserState state) {
        final ContactsSubState contacts = state.contacts;

        return Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_homeNumber.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: contacts.homeNumber,
                    onChanged: (String value) => bloc.add(UpdateContacts(homeNumber: value)),
                    error: contacts.homeNumberError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_mobileNumber.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: contacts.mobileNumber,
                    onChanged: (String value) => bloc.add(UpdateContacts(mobileNumber: value)),
                    error: contacts.mobileNumberError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_email.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: contacts.email,
                    onChanged: (String value) => bloc.add(UpdateContacts(email: value)),
                    error: contacts.emailError,
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
