import 'package:flutter/material.dart';

import '../core_ui.dart';

abstract class AppFonts {
  static const String _packageName = kPackageName;

  static const String _sansSarifFamily = 'Sans Serif';

  static const TextStyle sansSerif14Normal = TextStyle(
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontFamily: _sansSarifFamily,
    package: _packageName,
  );

  static const TextStyle sansSerif16Normal = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontFamily: _sansSarifFamily,
    package: _packageName,
  );

  static const TextStyle sansSerif20Normal = TextStyle(
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontFamily: _sansSarifFamily,
    package: _packageName,
  );

  static const TextStyle sansSerif24Normal = TextStyle(
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontFamily: _sansSarifFamily,
    package: _packageName,
  );
}
