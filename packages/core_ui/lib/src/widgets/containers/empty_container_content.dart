import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class EmptyContainerContent extends StatelessWidget {
  final String text;

  const EmptyContainerContent({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Center(
      child: Text(
        text,
        style: AppFonts.sansSerif16Normal.copyWith(
          color: colors.textLight,
        ),
      ),
    );
  }
}
