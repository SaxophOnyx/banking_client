import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: AppDimens.COLOR_CHANGE_DURATION,
          curve: AppDimens.COLOR_CHANGE_CURVE,
          constraints: const BoxConstraints(
            minHeight: AppDimens.APP_BUTTON_MIN_HEIGHT,
            minWidth: AppDimens.APP_BUTTON_MIN_WIDTH,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.isEnabled
                ? isHover
                    ? colors.primaryHover
                    : colors.primary
                : colors.disabled,
            borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          ),
          child: Text(
            widget.text,
            style: AppFonts.sansSerif16Normal.copyWith(
              color: widget.isEnabled ? colors.primaryText : colors.disabledText,
            ),
          ),
        ),
      ),
    );
  }
}
