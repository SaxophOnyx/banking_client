import 'package:core/core.dart';
import 'package:domain/domain.dart';

abstract class ValidationService {
  static final RegExp _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static String? notEmpty(String? value) {
    return value == null || value.isEmpty ? LocaleKeys.clients_errors_requiredField.translate() : null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!_emailRegExp.hasMatch(value)) {
      return 'Incorrect email';
    }

    return null;
  }

  static String? notEmptyInt(int? value) {
    return value == null ? LocaleKeys.clients_errors_requiredField.translate() : null;
  }

  static String? notEmptyBigInt(BigInt? value) {
    return value == null ? LocaleKeys.clients_errors_requiredField.translate() : null;
  }

  static String? notEmptyBool(bool? value) {
    return value == null ? LocaleKeys.clients_errors_requiredField.translate() : null;
  }

  static String? notEmptyFamilyStatus(FamilyStatus? value) {
    return value == null ? LocaleKeys.clients_errors_requiredField.translate() : null;
  }

  static String? notEmptyDateTime(DateTime? value) {
    return value == null ? LocaleKeys.clients_errors_requiredField.translate() : null;
  }

  static String? notEmptyGender(Gender? value) {
    return value == null ? LocaleKeys.clients_errors_requiredField.translate() : null;
  }

  static String? notEmptyDepositType(DepositType? value) {
    return value == null ? LocaleKeys.clients_errors_requiredField.translate() : null;
  }
}
