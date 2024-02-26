import 'package:flutter/services.dart';

class PercentageInputFormatter implements TextInputFormatter {
  const PercentageInputFormatter();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      final int? number = int.tryParse(newValue.text);

      if (number == null || number < 0 || number > 100) {
        return oldValue;
      }
    }

    return newValue;
  }
}
