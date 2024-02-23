import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:flutter/material.dart';

import 'key_table_cell.dart';
import 'value_table_cell.dart';

class ClientTable extends StatelessWidget {
  final Client client;

  const ClientTable({
    super.key,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder(
        verticalInside: BorderSide(
          width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
          color: colors.pageBorder,
        ),
        horizontalInside: BorderSide(
          width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
          color: colors.pageBorder,
        ),
        bottom: BorderSide(
          width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
          color: colors.pageBorder,
        ),
      ),
      children: <TableRow>[
        ..._personalInfoRows(),
        ..._addressRows(),
        ..._passportRows(),
        ..._contactsRows(),
        ..._employmentRows(),
        ..._miscRows(),
      ],
    );
  }

  List<TableRow> _personalInfoRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_id.translate()),
          ValueTableCell(value: client.id.toString()),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_firstName.translate()),
          ValueTableCell(value: client.firstName),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_middleName.translate()),
          ValueTableCell(value: client.middleName),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_lastName.translate()),
          ValueTableCell(value: client.lastName),
        ],
      ),
    ];
  }

  List<TableRow> _addressRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_birthAddress.translate()),
          ValueTableCell(value: client.birthAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_currentCity.translate()),
          ValueTableCell(value: client.currentCity),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_currentAddress.translate()),
          ValueTableCell(value: client.currentAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_cityOfResidence.translate()),
          ValueTableCell(value: client.cityOfResidence),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_residenceAddress.translate()),
          ValueTableCell(value: client.residenceAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_citizenship.translate()),
          ValueTableCell(value: client.citizenship),
        ],
      ),
    ];
  }

  List<TableRow> _passportRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_passwordSeries.translate()),
          ValueTableCell(value: client.passportSeries),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_passwordNumber.translate()),
          ValueTableCell(value: client.passportNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_idNumber.translate()),
          ValueTableCell(value: client.idNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_issuing.translate()),
          ValueTableCell(value: client.issuing),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: '${LocaleKeys.clients_labels_issuingDate.translate()} ()'),
          ValueTableCell(value: DateFormatter.format(client.issuingDate)),
        ],
      ),
    ];
  }

  List<TableRow> _contactsRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_homeNumber.translate()),
          ValueTableCell(value: client.homeNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_mobileNumber.translate()),
          ValueTableCell(value: client.mobileNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_email.translate()),
          ValueTableCell(value: client.email),
        ],
      ),
    ];
  }

  List<TableRow> _employmentRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_position.translate()),
          ValueTableCell(value: client.position),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_placeOfWork.translate()),
          ValueTableCell(value: client.placeOfWork),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_monthlyIncome.translate()),
          ValueTableCell(value: NumberFormatter.formatIncome(client.monthlyIncome)),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_retiree.translate()),
          ValueTableCell(value: BooleanFormatter.formatYesNo(client.retiree)),
        ],
      ),
    ];
  }

  List<TableRow> _miscRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_familyStatus.translate()),
          ValueTableCell(value: client.familyStatus.name),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_disability.translate()),
          ValueTableCell(value: client.disability.name),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.clients_labels_conscription.translate()),
          ValueTableCell(value: BooleanFormatter.formatYesNo(client.conscription)),
        ],
      ),
    ];
  }
}
