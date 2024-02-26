import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ClientTable extends StatelessWidget {
  final Client client;

  const ClientTable({
    super.key,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    return DisplayTableBase(
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
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_id.translate()),
          DisplayValueTableCell(value: client.id.toString()),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_firstName.translate()),
          DisplayValueTableCell(value: client.firstName),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_middleName.translate()),
          DisplayValueTableCell(value: client.middleName),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_lastName.translate()),
          DisplayValueTableCell(value: client.lastName),
        ],
      ),
    ];
  }

  List<TableRow> _addressRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_birthAddress.translate()),
          DisplayValueTableCell(value: client.birthAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_currentCity.translate()),
          DisplayValueTableCell(value: client.currentCity),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_currentAddress.translate()),
          DisplayValueTableCell(value: client.currentAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_cityOfResidence.translate()),
          DisplayValueTableCell(value: client.cityOfResidence),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_residenceAddress.translate()),
          DisplayValueTableCell(value: client.residenceAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_citizenship.translate()),
          DisplayValueTableCell(value: client.citizenship),
        ],
      ),
    ];
  }

  List<TableRow> _passportRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_passwordSeries.translate()),
          DisplayValueTableCell(value: client.passportSeries),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_passwordNumber.translate()),
          DisplayValueTableCell(value: client.passportNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_idNumber.translate()),
          DisplayValueTableCell(value: client.idNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_issuing.translate()),
          DisplayValueTableCell(value: client.issuing),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: '${LocaleKeys.clients_labels_issuingDate.translate()} ()'),
          DisplayValueTableCell(value: DateFormatter.format(client.issuingDate)),
        ],
      ),
    ];
  }

  List<TableRow> _contactsRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_homeNumber.translate()),
          DisplayValueTableCell(value: client.homeNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_mobileNumber.translate()),
          DisplayValueTableCell(value: client.mobileNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_email.translate()),
          DisplayValueTableCell(value: client.email),
        ],
      ),
    ];
  }

  List<TableRow> _employmentRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_position.translate()),
          DisplayValueTableCell(value: client.position),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_placeOfWork.translate()),
          DisplayValueTableCell(value: client.placeOfWork),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_monthlyIncome.translate()),
          DisplayValueTableCell(value: NumberFormatter.formatIncome(client.monthlyIncome)),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_retiree.translate()),
          DisplayValueTableCell(value: BooleanFormatter.formatYesNo(client.retiree)),
        ],
      ),
    ];
  }

  List<TableRow> _miscRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_familyStatus.translate()),
          DisplayValueTableCell(value: client.familyStatus.name),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_disability.translate()),
          DisplayValueTableCell(value: client.disability.name),
        ],
      ),
      TableRow(
        children: <Widget>[
          DisplayKeyTableCell(value: LocaleKeys.clients_labels_conscription.translate()),
          DisplayValueTableCell(value: BooleanFormatter.formatYesNo(client.conscription)),
        ],
      ),
    ];
  }
}
