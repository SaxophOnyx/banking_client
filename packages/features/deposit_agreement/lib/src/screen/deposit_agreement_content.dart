import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

import '../bloc/deposit_agreement_bloc.dart';

class DepositAgreementContent extends StatelessWidget {
  const DepositAgreementContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacer = AppDimens.PAGE_CONTENT_PADDING * 2;

    final DepositAgreementBloc bloc = context.read<DepositAgreementBloc>();

    return FormDialogTemplate(
      child: BlocBuilder<DepositAgreementBloc, DepositAgreementState>(
        builder: (BuildContext context, DepositAgreementState state) {
          return Column(
            children: <Widget>[
              Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(2),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      InputKeyTableCell(value: LocaleKeys.deposit_labels_type.translate()),
                      InputValueTableCell(
                        child: TableDropDown<DepositType>(
                          values: DepositType.values,
                          value: state.depositType,
                          stringifier: (DepositType item) => item.localeKey.translate(),
                          onChanged: (DepositType? value) => bloc.add(UpdateDepositType(value)),
                          error: state.depositTypeError,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      InputKeyTableCell(value: LocaleKeys.deposit_labels_agreementNumber.translate()),
                      InputValueTableCell(
                        child: DelayedTableTextField(
                          value: state.agreementNumber,
                          onChanged: (String value) => bloc.add(UpdateAgreementNumber(value)),
                          error: state.agreementNumberError,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      InputKeyTableCell(value: LocaleKeys.deposit_labels_agreementBegin.translate()),
                      InputValueTableCell(
                        child: TableDatePicker(
                          value: state.agreementBegin,
                          onChange: (DateTime date) => bloc.add(UpdateAgreementDates(begin: date)),
                          error: state.agreementBeginError,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      InputKeyTableCell(value: LocaleKeys.deposit_labels_agreementEnd.translate()),
                      InputValueTableCell(
                        child: TableDatePicker(
                          value: state.agreementEnd,
                          onChange: (DateTime date) => bloc.add(UpdateAgreementDates(end: date)),
                          error: state.agreementEndErrorDisplayError,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      InputKeyTableCell(value: LocaleKeys.deposit_labels_amount.translate()),
                      InputValueTableCell(
                        child: DelayedTableTextField(
                          value: state.amount?.toString(),
                          onChanged: (String value) => bloc.add(UpdateAmount(BigInt.tryParse(value))),
                          formatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          error: state.amountError,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      InputKeyTableCell(value: '${LocaleKeys.deposit_labels_interest.translate()}, %'),
                      InputValueTableCell(
                        child: DelayedTableTextField(
                          value: state.interest?.toString(),
                          onChanged: (String value) => bloc.add(UpdateInterest(int.tryParse(value))),
                          formatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            const PercentageInputFormatter(),
                          ],
                          error: state.interestError,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: spacer),
              AppButton(
                text: LocaleKeys.common_submit.translate(),
                onPressed: () => bloc.add(const SubmitForm()),
              ),
            ],
          );
        },
      ),
    );
  }
}
