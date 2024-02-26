import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/edit_client_bloc.dart';
import '../bloc/substates/contacts_substate.dart';

class ContactsForm extends StatelessWidget {
  const ContactsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditClientBloc bloc = context.read<EditClientBloc>();

    return BlocBuilder<EditClientBloc, EditClientState>(
      buildWhen: (EditClientState prev, EditClientState curr) => prev.didContactsChanged(curr),
      builder: (BuildContext context, EditClientState state) {
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
                InputKeyTableCell(value: LocaleKeys.clients_labels_homeNumber.translate()),
                InputValueTableCell(
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
                InputKeyTableCell(value: LocaleKeys.clients_labels_mobileNumber.translate()),
                InputValueTableCell(
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
                InputKeyTableCell(value: LocaleKeys.clients_labels_email.translate()),
                InputValueTableCell(
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
