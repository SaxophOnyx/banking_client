import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'app_navigation_bar_item.dart';

class AppNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> items;
  final int index;
  final void Function(int index) onItemPressed;

  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.NAVIGATION_BAR_HEIGHT);

  const AppNavigationBar({
    super.key,
    required this.items,
    required this.index,
    required this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return SizedBox(
      height: AppDimens.NAVIGATION_BAR_HEIGHT,
      child: Material(
        color: colors.primary,
        elevation: AppDimens.NAVIGATION_BAR_ELEVATION,
        child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int i) {
            final bool isSelected = index == i;

            return AppNavigationBarItem(
              text: items[i],
              isSelected: isSelected,
              onPressed: () {
                if (!isSelected) {
                  onItemPressed(i);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
