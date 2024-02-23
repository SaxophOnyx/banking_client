import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/features/users/src/widgets/details/key_table_cell.dart';
import 'package:banking_client/features/users/src/widgets/details/value_table_cell.dart';
import 'package:flutter/material.dart';

class UserTable extends StatelessWidget {
  final User user;

  const UserTable({
    super.key,
    required this.user,
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
          KeyTableCell(value: LocaleKeys.users_labels_id.translate()),
          ValueTableCell(value: user.id.toString()),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_firstName.translate()),
          ValueTableCell(value: user.firstName),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_middleName.translate()),
          ValueTableCell(value: user.middleName),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_lastName.translate()),
          ValueTableCell(value: user.lastName),
        ],
      ),
    ];
  }

  List<TableRow> _addressRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_birthAddress.translate()),
          ValueTableCell(value: user.birthAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_currentCity.translate()),
          ValueTableCell(value: user.currentCity),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_currentAddress.translate()),
          ValueTableCell(value: user.currentAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_cityOfResidence.translate()),
          ValueTableCell(value: user.cityOfResidence),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_residenceAddress.translate()),
          ValueTableCell(value: user.residenceAddress),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_citizenship.translate()),
          ValueTableCell(value: user.citizenship),
        ],
      ),
    ];
  }

  List<TableRow> _passportRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_passwordSeries.translate()),
          ValueTableCell(value: user.passportSeries),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_passwordNumber.translate()),
          ValueTableCell(value: user.passportNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_idNumber.translate()),
          ValueTableCell(value: user.idNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_issuing.translate()),
          ValueTableCell(value: user.issuing),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: '${LocaleKeys.users_labels_issuingDate.translate()} ()'),
          ValueTableCell(value: DateFormatter.format(user.issuingDate)),
        ],
      ),
    ];
  }

  List<TableRow> _contactsRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_homeNumber.translate()),
          ValueTableCell(value: user.homeNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_mobileNumber.translate()),
          ValueTableCell(value: user.mobileNumber),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_email.translate()),
          ValueTableCell(value: user.email),
        ],
      ),
    ];
  }

  List<TableRow> _employmentRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_position.translate()),
          ValueTableCell(value: user.position),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_placeOfWork.translate()),
          ValueTableCell(value: user.placeOfWork),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_monthlyIncome.translate()),
          ValueTableCell(value: NumberFormatter.formatIncome(user.monthlyIncome)),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_retiree.translate()),
          ValueTableCell(value: BooleanFormatter.formatYesNo(user.retiree)),
        ],
      ),
    ];
  }

  List<TableRow> _miscRows() {
    return <TableRow>[
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_familyStatus.translate()),
          ValueTableCell(value: user.familyStatus.name),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_disability.translate()),
          ValueTableCell(value: user.disability.name),
        ],
      ),
      TableRow(
        children: <Widget>[
          KeyTableCell(value: LocaleKeys.users_labels_conscription.translate()),
          ValueTableCell(value: BooleanFormatter.formatYesNo(user.conscription)),
        ],
      ),
    ];
  }
}
