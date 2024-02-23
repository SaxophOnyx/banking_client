import 'package:banking_client/core/core.dart';

abstract class BooleanFormatter {
  static String formatYesNo(bool value) {
    return value ? LocaleKeys.common_yes.translate() : LocaleKeys.common_no.translate();
  }
}
