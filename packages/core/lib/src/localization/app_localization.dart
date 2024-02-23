import 'dart:ui';

abstract class AppLocalization {
  static const String localizationFilesPath = 'resources/lang';

  static List<Locale> get supportedLocales => <Locale>[_enLocale];

  static Locale get fallbackLocale => _enLocale;

  static const Locale _enLocale = Locale('en');
}
