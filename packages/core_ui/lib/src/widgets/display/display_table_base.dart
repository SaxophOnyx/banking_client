import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class DisplayTableBase extends StatelessWidget {
  final List<TableRow> children;
  final bool fullBorder;

  const DisplayTableBase({
    super.key,
    required this.children,
    this.fullBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder(
        verticalInside: BorderSide(
          width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
          color: colors.pageBorder,
        ),
        horizontalInside: BorderSide(
          width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
          color: colors.pageBorder,
        ),
        bottom: BorderSide(
          width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
          color: colors.pageBorder,
        ),
        top: fullBorder
            ? BorderSide(
                width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
                color: colors.pageBorder,
              )
            : BorderSide.none,
        left: fullBorder
            ? BorderSide(
                width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
                color: colors.pageBorder,
              )
            : BorderSide.none,
        right: fullBorder
            ? BorderSide(
                width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
                color: colors.pageBorder,
              )
            : BorderSide.none,
      ),
      children: children,
    );
  }
}
