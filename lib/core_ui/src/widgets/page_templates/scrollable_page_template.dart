import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ScrollablePageTemplate extends StatelessWidget {
  final List<Widget> children;
  final bool insertFooterSpacer;

  const ScrollablePageTemplate({
    super.key,
    required this.children,
    this.insertFooterSpacer = true,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Row(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: insertFooterSpacer
                          ? <Widget>[
                              ...children,
                              const Spacer(),
                            ]
                          : children,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
