import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: AppFonts.sansSerif16Normal.copyWith(
            fontWeight: FontWeight.bold,
            color: widget.isEnabled
                ? isHover
                    ? colors.primaryHover
                    : colors.primary
                : colors.disabledText,
          ),
        ),
      ),
    );
  }
}
