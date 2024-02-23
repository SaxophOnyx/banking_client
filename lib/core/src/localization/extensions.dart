import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

extension LocalizationtringExtensions on String {
  String translate({
    Map<String, String>? namedArgs,
    BuildContext? context,
  }) {
    return this.tr(
      namedArgs: namedArgs,
      context: context,
    );
  }
}
