import 'package:flutter/services.dart';

class MobilePhoneInputFormatter extends TextInputFormatter {
  static final RegExp _phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;
    return _phoneRegex.hasMatch(newText) || newText.isEmpty ? newValue : oldValue;
  }
}
