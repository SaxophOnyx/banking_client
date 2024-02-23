import 'package:flutter/material.dart';

import 'app_colors.dart';

class DefaultColors extends AppColors {
  @override
  Color get primary => const Color.fromARGB(255, 36, 187, 82);

  @override
  Color get primaryText => Colors.white;

  @override
  Color get primaryHover => const Color.fromARGB(255, 55, 217, 104);

  @override
  Color get background => Colors.white;

  @override
  Color get page => const Color.fromARGB(255, 246, 246, 246);

  @override
  Color get pageBorder => const Color.fromARGB(255, 195, 195, 195);

  @override
  Color get text => const Color.fromARGB(255, 24, 24, 24);

  @override
  Color get textLight => const Color.fromARGB(255, 195, 195, 195);

  @override
  Color get shadow => Colors.grey.shade600;

  @override
  Color get widget => Colors.grey.shade200;

  @override
  Color get error => Colors.red;

  @override
  Color get success => Colors.green.shade900;

  @override
  Color get disabled => Colors.grey.shade300;

  @override
  Color get disabledText => Colors.grey.shade500;

  @override
  Color get transparent => Colors.transparent;

  const DefaultColors();
}
