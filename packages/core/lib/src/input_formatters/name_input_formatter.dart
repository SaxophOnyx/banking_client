import 'package:flutter/services.dart';

class NameInputFormatter implements TextInputFormatter {
  // static final RegExp _cyrillicRexExp = RegExp(r'[а-яА-Я]+');
  static final RegExp _latinRexExp = RegExp(r'[a-zA-Z]+');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final String input = newValue.text;

    /*
    final String? cyrillicMatch = _cyrillicRexExp.firstMatch(input)?[0];
    if (cyrillicMatch != null && cyrillicMatch.length == input.length) {
      return newValue;
    }
     */

    final String? latinMatch = _latinRexExp.firstMatch(input)?[0];
    if (latinMatch != null && latinMatch.length == input.length) {
      return newValue;
    }

    return oldValue;
  }
}
