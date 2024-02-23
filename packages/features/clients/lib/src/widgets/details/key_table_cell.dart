import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class KeyTableCell extends StatelessWidget {
  final String value;

  const KeyTableCell({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: AppDimens.TABLE_ROW_MIN_HEIGHT,
      ),
      child: ColoredBox(
        color: colors.background,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.TABLE_ROW_CONTENT_PADDING_X,
              vertical: AppDimens.TABLE_ROW_CONTENT_PADDING_Y,
            ),
            child: Text(
              value,
              style: AppFonts.sansSerif16Normal.copyWith(
                color: colors.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
