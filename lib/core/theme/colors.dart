import 'package:flutter/material.dart';

class AppColors {
  static const seed = Colors.blue;

  // Light Theme
  static final lightColorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.light,
  );

  // Dark Theme
  static final darkColorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
  );
}
