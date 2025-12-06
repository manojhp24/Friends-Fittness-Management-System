import 'package:flutter/material.dart';

/// Elevated button theme configuration.
///
/// Provides consistent styling for all elevated buttons throughout the app
/// with Material 3 design principles.
class AppElevatedButtonTheme {
  // Private constructor to prevent instantiation
  AppElevatedButtonTheme._();

  /// Creates an elevated button theme for the given color scheme.
  ///
  /// Returns a [ElevatedButtonThemeData] configured with:
  /// - Primary container background color
  /// - Appropriate foreground colors for enabled/disabled states
  /// - Fixed height of 50px
  /// - Rounded corners with 10px radius
  /// - Subtle ripple effects
  static ElevatedButtonThemeData elevated(ColorScheme scheme) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        // Background color based on button state
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.surfaceContainerHighest.withValues(alpha: 0.4);
          }
          return scheme.primaryContainer;
        }),

        // Foreground (text/icon) color based on button state
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onSurface.withValues(alpha: 0.4);
          }
          return scheme.onPrimaryContainer;
        }),

        // Flat design with no elevation
        elevation: WidgetStateProperty.all(0),

        // Fixed button height
        minimumSize: WidgetStateProperty.all(
          const Size.fromHeight(50),
        ),

        // Rounded border radius
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        // Internal padding
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),

        // Ripple effect on press
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return scheme.primary.withValues(alpha: 0.10);
          }
          return null;
        }),
      ),
    );
  }
}
