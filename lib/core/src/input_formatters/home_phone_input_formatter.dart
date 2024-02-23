import 'package:flutter/services.dart';

class HomePhoneInputFormatter extends TextInputFormatter {
  static final RegExp _phoneRegex = RegExp(r'^\(?(\d{3})\)?[\s-]?\d{3}[\s-]?\d{4}$');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;
    return newText.isEmpty || _phoneRegex.hasMatch(newText) ? newValue : oldValue;
  }
}
