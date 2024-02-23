import 'package:flutter/material.dart';

abstract class AppColors extends ThemeExtension<AppColors> {
  Color get primary;

  Color get primaryText;

  Color get primaryHover;

  Color get background;

  Color get page;

  Color get pageBorder;

  Color get text;

  Color get textLight;

  Color get shadow;

  Color get widget;

  Color get error;

  Color get success;

  Color get disabled;

  Color get disabledText;

  Color get transparent;

  const AppColors();

  @override
  ThemeExtension<AppColors> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    throw UnimplementedError();
  }
}
