import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/features/edit_user/src/bloc/edit_user_bloc.dart';
import 'package:banking_client/features/edit_user/src/bloc/substates/address_substate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../input_table_cell.dart';
import '../key_table_cell.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditUserBloc bloc = context.read<EditUserBloc>();

    return BlocBuilder<EditUserBloc, EditUserState>(
      buildWhen: (EditUserState prev, EditUserState curr) => prev.didAddressChanged(curr),
      builder: (BuildContext context, EditUserState state) {
        final AddressSubState address = state.address;

        return Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_birthAddress.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: address.birthAddress,
                    onChanged: (String value) => bloc.add(UpdateAddress(birthAddress: value)),
                    error: address.birthAddressError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_currentCity.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: address.currentCity,
                    onChanged: (String value) => bloc.add(UpdateAddress(currentCity: value)),
                    error: address.currentCityError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_currentAddress.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: address.currentAddress,
                    onChanged: (String value) => bloc.add(UpdateAddress(currentAddress: value)),
                    error: address.currentAddressError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_cityOfResidence.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: address.cityOfResidence,
                    onChanged: (String value) => bloc.add(UpdateAddress(cityOfResidence: value)),
                    error: address.cityOfResidenceError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_residenceAddress.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: address.residenceAddress,
                    onChanged: (String value) => bloc.add(UpdateAddress(residenceAddress: value)),
                    error: address.residenceAddressError,
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                KeyTableCell(value: LocaleKeys.users_labels_citizenship.translate()),
                InputTableCell(
                  child: DelayedTableTextField(
                    value: address.citizenship,
                    onChanged: (String value) => bloc.add(UpdateAddress(citizenship: value)),
                    error: address.citizenshipError,
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
