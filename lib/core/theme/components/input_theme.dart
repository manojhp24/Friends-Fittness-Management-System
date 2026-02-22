import 'package:flutter/material.dart';

class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme inputDecorationTheme(ColorScheme scheme) {
    return InputDecorationTheme(
      isDense: true,

      labelStyle: TextStyle(
        color: scheme.onSurfaceVariant,
        fontSize: 14,
      ),

      filled: true,
      fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.4),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12, // was 20
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: scheme.outlineVariant, width: 1.1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: scheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: scheme.error, width: 1.1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: scheme.error, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
            color: scheme.outlineVariant.withValues(alpha: 0.5), width: 1.1),
      ),

      floatingLabelStyle: TextStyle(
        color: scheme.primary,
        fontWeight: FontWeight.w600,
      ),

      errorStyle: TextStyle(
        color: scheme.error,
        fontSize: 12,
      ),
    );
  }
}
