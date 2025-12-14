import 'package:flutter/material.dart';

class ThemeHelpers {
  ThemeHelpers._();

  static ColorScheme scheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
