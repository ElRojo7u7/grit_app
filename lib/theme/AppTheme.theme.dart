import 'package:flutter/material.dart';
import 'package:grit/theme/color_schemes.theme.dart';

class AppTheme {

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightColors.background,

      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: lightColors.primary,
        onPrimary: lightColors.onPrimary,
        secondary: lightColors.surfaceVariant,
        onSecondary: lightColors.textPrimary,
        error: lightColors.error,
        onError: Colors.white,
        background: lightColors.background,
        onBackground: lightColors.textPrimary,
        surface: lightColors.surface,
        onSurface: lightColors.textPrimary,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkColors.background,

      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkColors.primary,
        onPrimary: darkColors.onPrimary,
        secondary: darkColors.surfaceVariant,
        onSecondary: darkColors.textPrimary,
        error: darkColors.error,
        onError: Colors.black,
        background: darkColors.background,
        onBackground: darkColors.textPrimary,
        surface: darkColors.surface,
        onSurface: darkColors.textPrimary,
      ),
    );
  }
}
