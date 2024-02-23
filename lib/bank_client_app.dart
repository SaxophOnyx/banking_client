import 'package:banking_client/core/core.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:banking_client/navigation/navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BankClientApp extends StatelessWidget {
  const BankClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appDi.get<AppRouter>();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<AppColors>>[
          const DefaultColors(),
        ],
      ),
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
