import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FormDialogTemplate extends StatelessWidget {
  final List<Widget> children;

  const FormDialogTemplate({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      width: AppDimens.DEFAULT_DIALOG_WIDTH,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(
          AppDimens.DEFAULT_BORDER_RADIUS,
        ),
      ),
      padding: const EdgeInsets.all(AppDimens.PAGE_CONTENT_PADDING),
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
