import 'package:flutter/material.dart';

class AppColors {
  // Brand
  final Color primary;
  final Color onPrimary;

  // Surfaces
  final Color background;
  final Color surface;
  final Color surfaceVariant;

  // Text
  final Color textPrimary;
  final Color textSecondary;

  // Status
  final Color success;
  final Color error;
  final Color warning;

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    required this.success,
    required this.error,
    required this.warning,
  });
}
