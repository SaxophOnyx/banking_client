import 'package:core_ui/core_ui.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class TableDropDown<T> extends StatelessWidget {
  final List<T> values;
  final T? value;

  final String Function(T item) stringifier;
  final void Function(T? value) onChanged;

  final String error;

  const TableDropDown({
    super.key,
    required this.values,
    required this.value,
    required this.stringifier,
    required this.onChanged,
    this.error = '',
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: true,
              hint: error.isNotEmpty
                  ? Text(
                      error,
                      style: AppFonts.sansSerif16Normal.copyWith(
                        color: colors.error,
                      ),
                    )
                  : null,
              iconStyleData: IconStyleData(
                iconEnabledColor: colors.text,
                iconDisabledColor: colors.disabledText,
              ),
              items: List<DropdownMenuItem<T>>.generate(values.length, (int i) {
                final T item = values[i];
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    stringifier(item),
                  ),
                );
              }),
              style: AppFonts.sansSerif16Normal.copyWith(
                color: colors.text,
              ),
              value: value,
              onChanged: onChanged,
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  color: colors.widget,
                  border: Border(
                    bottom: BorderSide(
                      color: colors.pageBorder,
                      width: AppDimens.INPUT_BORDER_THICKNESS,
                    ),
                  ),
                ),
                height: AppDimens.INPUT_HEIGHT,
              ),
              menuItemStyleData: MenuItemStyleData(
                height: AppDimens.INPUT_HEIGHT,
                overlayColor: MaterialStatePropertyAll<Color>(colors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
