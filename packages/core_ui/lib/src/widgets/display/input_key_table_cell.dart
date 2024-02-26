import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class InputKeyTableCell extends StatelessWidget {
  final String value;

  const InputKeyTableCell({
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
      child: Align(
        alignment: Alignment.center,
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
    );
  }
}
