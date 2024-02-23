import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/features/users/src/widgets/details/user_table.dart';
import 'package:banking_client/features/users/src/widgets/shared/decorated_container.dart';
import 'package:flutter/material.dart';

class UsersDetails extends StatelessWidget {
  final User? user;

  const UsersDetails({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final User? maybeUser = user;

    return DecoratedContainer(
      label: LocaleKeys.users_userDetails.translate(),
      child: maybeUser == null
          ? Center(
              child: Text(
                LocaleKeys.users_noSelectedUser.translate(),
                style: AppFonts.sansSerif16Normal.copyWith(
                  color: colors.textLight,
                ),
              ),
            )
          : SingleChildScrollView(
              child: UserTable(
                user: maybeUser,
              ),
            ),
    );
  }
}
