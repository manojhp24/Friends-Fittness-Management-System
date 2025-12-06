import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_management_system/core/theme/colors.dart';
import 'package:gym_management_system/core/theme/components/elevated_button_theme.dart';
import 'package:gym_management_system/core/theme/components/input_theme.dart';

/// Central theme configuration for the gym management system.
///
/// Provides both light and dark theme configurations using Material 3 design
/// with Poppins font family and custom color schemes.
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Light theme configuration for the application.
  ///
  /// Uses Material 3 design with a light color scheme and Poppins typography.
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: AppColors.lightColorScheme,
        textTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.lightColorScheme.surfaceContainerLow,
          foregroundColor: AppColors.lightColorScheme.onSurface,
          elevation: 0,
        ),
        elevatedButtonTheme: AppElevatedButtonTheme.elevated(
          AppColors.lightColorScheme,
        ),
        inputDecorationTheme: AppInputTheme.inputDecorationTheme(
          AppColors.lightColorScheme,
        ),
      );

  /// Dark theme configuration for the application.
  ///
  /// Uses Material 3 design with a dark color scheme and Poppins typography.
  /// Optimized for low-light environments with appropriate contrast ratios.
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: AppColors.darkColorScheme,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: AppColors.darkColorScheme.surfaceContainerLowest,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkColorScheme.surfaceContainerLow,
          foregroundColor: AppColors.darkColorScheme.onSurface,
          elevation: 0,
        ),
        elevatedButtonTheme: AppElevatedButtonTheme.elevated(
          AppColors.darkColorScheme,
        ),
        inputDecorationTheme: AppInputTheme.inputDecorationTheme(
          AppColors.darkColorScheme,
        ),
      );
}
