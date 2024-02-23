import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_di_setup.dart';
import 'bank_client_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  setupAppDI();

  runApp(
    EasyLocalization(
      fallbackLocale: AppLocalization.fallbackLocale,
      startLocale: AppLocalization.fallbackLocale,
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.localizationFilesPath,
      useOnlyLangCode: true,
      useFallbackTranslations: true,
      saveLocale: false,
      child: const BankClientApp(),
    ),
  );
}
