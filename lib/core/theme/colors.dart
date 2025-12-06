import 'package:flutter/material.dart';

/// Application color configuration.
///
/// Defines the color schemes for both light and dark themes using Material 3
/// color system with a seed color approach for consistent color harmonies.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  /// Primary seed color used to generate the color schemes.
  ///
  /// This color is used as the base for generating harmonious color palettes
  /// for both light and dark themes following Material 3 guidelines.
  static const Color seed = Colors.blue;

  /// Light theme color scheme.
  ///
  /// Generated from the seed color with light brightness.
  /// Provides colors optimized for light backgrounds with appropriate contrast.
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.light,
  );

  /// Dark theme color scheme.
  ///
  /// Generated from the seed color with dark brightness.
  /// Provides colors optimized for dark backgrounds with appropriate contrast
  /// and reduced eye strain in low-light environments.
  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
  );
}
