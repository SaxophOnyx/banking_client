import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

class TableDatePicker extends StatelessWidget {
  final DateTime? value;
  final String error;
  final void Function(DateTime date) onChange;

  const TableDatePicker({
    super.key,
    this.value,
    this.error = '',
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final bool hasError = error.isNotEmpty;

    return GestureDetector(
      onTap: () async {
        final DateTime? date = await _showPicker(context);
        if (date != null) {
          onChange(date);
        }
      },
      child: Container(
        width: double.infinity,
        height: AppDimens.INPUT_HEIGHT,
        decoration: BoxDecoration(
          color: colors.widget,
          border: Border(
            bottom: BorderSide(
              width: AppDimens.INPUT_BORDER_THICKNESS,
              color: colors.pageBorder,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          hasError ? error : DateFormatter.format(value),
          textAlign: TextAlign.center,
          style: AppFonts.sansSerif16Normal.copyWith(
            color: hasError ? colors.error : colors.text,
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _showPicker(BuildContext context) async {
    return showWebDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
    );
  }
}
