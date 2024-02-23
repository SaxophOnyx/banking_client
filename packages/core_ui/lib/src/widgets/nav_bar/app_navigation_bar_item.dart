import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppNavigationBarItem extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const AppNavigationBarItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<AppNavigationBarItem> createState() => _AppNavigationBarItemState();
}

class _AppNavigationBarItemState extends State<AppNavigationBarItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AnimatedContainer(
      duration: AppDimens.COLOR_CHANGE_DURATION,
      curve: AppDimens.COLOR_CHANGE_CURVE,
      constraints: const BoxConstraints(
        minWidth: AppDimens.NAVIGATION_BAR_ITEM_MIN_WIDTH,
      ),
      alignment: Alignment.center,
      color: isHover ? colors.primaryHover : colors.primary,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.NAVIGATION_BAR_ITEM_PADDING_X,
              vertical: AppDimens.NAVIGATION_BAR_ITEM_PADDING_Y,
            ),
            child: Text(
              widget.text,
              style: AppFonts.sansSerif24Normal.copyWith(
                color: colors.primaryText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
