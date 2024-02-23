import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TableBooleanPicker extends StatelessWidget {
  final bool? value;
  final void Function(bool? value) onChanged;
  final String error;

  const TableBooleanPicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.error = '',
  });

  @override
  Widget build(BuildContext context) {
    return TableDropDown<bool>(
      values: const <bool>[true, false],
      value: value,
      stringifier: (bool item) => item ? LocaleKeys.common_yes.translate() : LocaleKeys.common_no.translate(),
      onChanged: onChanged,
      error: error,
    );
  }
}
