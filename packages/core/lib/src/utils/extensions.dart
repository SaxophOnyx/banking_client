import 'package:core/core.dart';
import 'package:domain/domain.dart';

extension GenderLocaleKeyGetter on Gender {
  String get localeKey {
    switch (this) {
      case Gender.male:
        return LocaleKeys.common_gender__male;
      case Gender.female:
        return LocaleKeys.common_gender__female;
      case Gender.other:
        return LocaleKeys.common_gender__other;
    }
  }
}

extension StringConversion on String {
  String? get nullIfEmpty {
    return isEmpty ? null : this;
  }
}
