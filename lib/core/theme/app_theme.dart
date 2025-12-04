import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_management_system/core/theme/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.lightColorScheme,
    textTheme: GoogleFonts.poppinsTextTheme(),
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightColorScheme.surfaceContainerLow,
      foregroundColor: AppColors.lightColorScheme.onSurface,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: AppColors.darkColorScheme.surfaceContainerLowest,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkColorScheme.surfaceContainerHigh,
      foregroundColor: AppColors.darkColorScheme.onSurface,
      elevation: 0,
    ),
  );
}
