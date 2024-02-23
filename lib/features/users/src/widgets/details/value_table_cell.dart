import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ValueTableCell extends StatelessWidget {
  final String? value;

  const ValueTableCell({
    super.key,
    this.value,
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
              value ?? LocaleKeys.common_empty.translate(),
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
