import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/edit_client_bloc.dart';
import '../widgets/address_form.dart';
import '../widgets/contacts_form.dart';
import '../widgets/employment_form.dart';
import '../widgets/misc_form.dart';
import '../widgets/passport_form.dart';
import '../widgets/personal_form.dart';

class EditClientContent extends StatelessWidget {
  const EditClientContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    const double gap = AppDimens.PAGE_CONTENT_PADDING;
    const double spacer = gap * 2;

    return FormDialogTemplate(
      child: Column(
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
          BlocBuilder<EditClientBloc, EditClientState>(
            builder: (BuildContext context, EditClientState state) {
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
                        final EditClientBloc bloc = context.read<EditClientBloc>();
                        bloc.add(const SubmitPressed());
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
