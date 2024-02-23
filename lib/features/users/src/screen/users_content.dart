import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/users_bloc.dart';
import '../widgets/details/user_details.dart';
import '../widgets/list/users_list.dart';

class UsersContent extends StatelessWidget {
  const UsersContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonSpacer = 40;

    final UsersBloc bloc = context.read<UsersBloc>();

    return PageTemplate(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (BuildContext context, UsersState state) {
                return UsersList(
                  items: state.users,
                  index: state.index,
                  onActiveItemChanged: (int index) => bloc.add(SelectedUserChanged(index)),
                  onItemDoublePressed: (int index) => bloc.add(EditUserPressed(index)),
                );
              },
            ),
          ),
          const SizedBox(width: AppDimens.PAGE_CONTENT_PADDING),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: BlocBuilder<UsersBloc, UsersState>(
                    builder: (BuildContext context, UsersState state) {
                      return UsersDetails(
                        user: state.selectedUser,
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppDimens.PAGE_CONTENT_PADDING),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AppTextButton(
                      text: LocaleKeys.users_buttons_editUser.translate(),
                      onPressed: () => bloc.add(const EditUserPressed()),
                    ),
                    const SizedBox(width: buttonSpacer),
                    AppButton(
                      text: LocaleKeys.users_buttons_createUser.translate(),
                      onPressed: () => bloc.add(const CreateUserPressed()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
