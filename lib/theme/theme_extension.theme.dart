import 'package:flutter/material.dart';
import 'package:grit/theme/AppColors.theme.dart';
import 'package:grit/theme/color_schemes.theme.dart';

extension ThemeGetter on BuildContext {

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  AppColors get colors => isDark ? darkColors : lightColors;

  TextTheme get text => Theme.of(this).textTheme;
}
