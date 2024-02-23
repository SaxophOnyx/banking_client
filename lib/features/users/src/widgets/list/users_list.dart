import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/domain/domain.dart';
import 'package:banking_client/features/users/src/widgets/shared/decorated_container.dart';
import 'package:flutter/material.dart';

import 'user_list_item.dart';

class UsersList extends StatelessWidget {
  final List<User> items;
  final int index;
  final void Function(int index) onActiveItemChanged;
  final void Function(int index) onItemDoublePressed;

  const UsersList({
    super.key,
    required this.items,
    required this.index,
    required this.onActiveItemChanged,
    required this.onItemDoublePressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return DecoratedContainer(
      label: LocaleKeys.users_usersList.translate(),
      child: items.isEmpty
          ? Center(
              child: Text(
                LocaleKeys.users_noUsersFound.translate(),
                style: AppFonts.sansSerif16Normal.copyWith(
                  color: colors.textLight,
                ),
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int i) {
                final User user = items[i];
                final bool isSelected = i == index;
                final String title = '${user.firstName} ${user.middleName} ${user.lastName}';

                return UserListItem(
                  title: title,
                  subtitle: user.id.toString(),
                  isSelected: isSelected,
                  onPressed: () {
                    if (!isSelected) {
                      onActiveItemChanged(i);
                    }
                  },
                  onDoublePressed: () => onItemDoublePressed(i),
                );
              },
            ),
    );
  }
}
