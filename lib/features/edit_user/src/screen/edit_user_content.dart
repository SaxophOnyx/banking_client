import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/features/edit_user/src/bloc/edit_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/forms/address_form.dart';
import '../widgets/forms/contacts_form.dart';
import '../widgets/forms/employment_form.dart';
import '../widgets/forms/misc_form.dart';
import '../widgets/forms/passport_form.dart';
import '../widgets/forms/personal_form.dart';

class EditUserContent extends StatelessWidget {
  const EditUserContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    const double gap = AppDimens.PAGE_CONTENT_PADDING;
    const double spacer = gap * 2;

    return FormDialogTemplate(
      children: <Widget>[
        const PersonalForm(),
        const SizedBox(height: gap),
        const AddressForm(),
        const SizedBox(height: gap),
        const PassportForm(),
        const SizedBox(height: gap),
        const ContactsForm(),
        const SizedBox(height: gap),
        const EmploymentForm(),
        const SizedBox(height: gap),
        const MiscForm(),
        const SizedBox(height: spacer),
        BlocBuilder<EditUserBloc, EditUserState>(
          builder: (BuildContext context, EditUserState state) {
            return Column(
              children: <Widget>[
                if (state.serverError.isNotEmpty) ...<Widget>[
                  Text(
                    state.serverError,
                    textAlign: TextAlign.center,
                    style: AppFonts.sansSerif16Normal.copyWith(
                      color: colors.error,
                    ),
                  ),
                  const SizedBox(height: spacer),
                ],
                Align(
                  alignment: Alignment.topRight,
                  child: AppButton(
                    text: LocaleKeys.common_submit.translate(),
                    onPressed: () {
                      final EditUserBloc bloc = context.read<EditUserBloc>();
                      bloc.add(const SubmitPressed());
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
