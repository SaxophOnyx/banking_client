import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;

  const PageTemplate({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Row(
      children: <Widget>[
        const Spacer(),
        Expanded(
          flex: AppDimens.PAGE_CONTENT_WIDTH_WEIGHT,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.page,
              border: Border(
                left: BorderSide(
                  color: colors.pageBorder,
                  width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
                ),
                right: BorderSide(
                  color: colors.pageBorder,
                  width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.PAGE_CONTENT_PADDING),
              child: child,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
