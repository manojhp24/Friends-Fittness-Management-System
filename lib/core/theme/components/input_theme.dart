import 'package:flutter/material.dart';

/// Input field theme configuration.
///
/// Provides consistent styling for all text input fields throughout the app
/// with Material 3 design principles.
class AppInputTheme {
  // Private constructor to prevent instantiation
  AppInputTheme._();

  /// Creates an input decoration theme for the given color scheme.
  ///
  /// Returns an [InputDecorationTheme] configured with:
  /// - Filled background with subtle color
  /// - Rounded borders with 10px radius
  /// - Proper border styles for all states (enabled, focused, error)
  /// - Consistent padding and label styling
  static InputDecorationTheme inputDecorationTheme(ColorScheme scheme) {
    return InputDecorationTheme(
      // Compact vertical spacing
      isDense: true,

      // Label text styling
      labelStyle: TextStyle(
        color: scheme.onSurfaceVariant,
        fontSize: 14,
      ),

      // Filled background
      filled: true,
      fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.4),

      // Internal padding
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),

      // Border when field is enabled but not focused
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: scheme.outlineVariant,
          width: 1.1,
        ),
      ),

      // Border when field is focused
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: scheme.primary,
          width: 2,
        ),
      ),

      // Border when field has an error
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: scheme.error,
          width: 1.1,
        ),
      ),

      // Border when field is focused and has an error
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: scheme.error,
          width: 2,
        ),
      ),

      // Border when field is disabled
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: scheme.outlineVariant.withValues(alpha: 0.5),
          width: 1.1,
        ),
      ),

      // Floating label styling when focused
      floatingLabelStyle: TextStyle(
        color: scheme.primary,
        fontWeight: FontWeight.w600,
      ),

      // Error text styling
      errorStyle: TextStyle(
        color: scheme.error,
        fontSize: 12,
      ),
    );
  }
}
