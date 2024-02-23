import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  final String label;
  final Widget child;

  const DecoratedContainer({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    const double horizontalSpacer = 12;
    const double verticalSpacer = 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: horizontalSpacer,
            bottom: verticalSpacer,
          ),
          child: Text(
            label,
            style: AppFonts.sansSerif20Normal.copyWith(
              color: colors.textLight,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: colors.background,
              border: Border.all(
                width: AppDimens.PAGE_CONTENT_BORDER_THICKNESS,
                color: colors.pageBorder,
              ),
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
