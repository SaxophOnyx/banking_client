import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ClientListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onPressed;
  final VoidCallback onDoublePressed;

  const ClientListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onPressed,
    required this.onDoublePressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        constraints: const BoxConstraints(
          minHeight: AppDimens.LIST_ITEM_MIN_HEIGHT,
        ),
        color: isSelected ? colors.primary : colors.transparent,
        duration: AppDimens.COLOR_CHANGE_DURATION,
        curve: AppDimens.COLOR_CHANGE_CURVE,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.LIST_ITEM_CONTENT_PADDING_X,
            vertical: AppDimens.LIST_ITEM_CONTENT_PADDING_Y,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.left,
                style: AppFonts.sansSerif16Normal.copyWith(
                  color: isSelected ? colors.primaryText : colors.text,
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.left,
                style: AppFonts.sansSerif16Normal.copyWith(
                  color: isSelected ? colors.primaryText : colors.textLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
