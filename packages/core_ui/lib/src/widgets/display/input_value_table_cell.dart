import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class InputValueTableCell extends StatelessWidget {
  final Widget child;

  const InputValueTableCell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: AppDimens.TABLE_ROW_MIN_HEIGHT,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.TABLE_ROW_CONTENT_PADDING_X,
            vertical: AppDimens.TABLE_ROW_CONTENT_PADDING_Y,
          ),
          child: child,
        ),
      ),
    );
  }
}
