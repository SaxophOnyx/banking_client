import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class InputTableCell extends StatelessWidget {
  final Widget child;

  const InputTableCell({
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
