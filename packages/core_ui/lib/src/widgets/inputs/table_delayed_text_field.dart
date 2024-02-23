import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DelayedTableTextField extends StatefulWidget {
  final String value;
  final String error;
  final void Function(String value) onChanged;
  final List<TextInputFormatter>? formatters;

  const DelayedTableTextField({
    super.key,
    required this.value,
    this.error = '',
    this.formatters,
    required this.onChanged,
  });

  @override
  State<DelayedTableTextField> createState() => _DelayedTableTextFieldState();
}

class _DelayedTableTextFieldState extends State<DelayedTableTextField> {
  late final TextEditingController controller;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value)
      ..addListener(() async {
        ++counter;
        final int curr = counter;

        await Future<void>.delayed(AppDimens.ON_CHANGED_DELAY);

        if (counter == curr) {
          counter = 0;
          widget.onChanged(controller.text);
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DelayedTableTextField old) {
    super.didUpdateWidget(old);

    if (widget.value != controller.text) {
      controller.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return TextField(
      controller: controller,
      inputFormatters: widget.formatters,
      cursorColor: colors.primary,
      style: AppFonts.sansSerif16Normal.copyWith(
        color: colors.text,
      ),
      decoration: InputDecoration(
        filled: true,
        errorText: widget.error.isNotEmpty ? widget.error : null,
        fillColor: colors.widget,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary,
            width: AppDimens.INPUT_BORDER_THICKNESS,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.pageBorder,
            width: AppDimens.INPUT_BORDER_THICKNESS,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.error,
            width: AppDimens.INPUT_BORDER_THICKNESS,
          ),
        ),
      ),
    );
  }
}
