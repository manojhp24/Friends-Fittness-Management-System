import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  // Layout & spacing
  static double get screenPadding => screenWidth * 0.04;

  static double get cardPadding => screenWidth * 0.04;

  static double get sectionSpace => screenHeight * 0.02;

  static double get spaceS => screenHeight * 0.012;

  static double get spaceM => screenHeight * 0.02;

  static double get spaceL => screenHeight * 0.03;

  // Radius
  static double get radius => screenWidth * 0.03;

  // Avatar sizing
  static double get avatarSize => screenWidth * 0.12;

  // Text scaling (responsive typography)
  static double get textScale {
    const baseWidth = 375.0; // standard design width
    double scale = screenWidth / baseWidth;
    return scale.clamp(0.85, 1.2); // prevents too small or too large text
  }

  static double get iconSize {
    const baseWidth = 375.0;
    double scale = screenWidth / baseWidth;

    double size = 24 * scale;

    return size.clamp(18, 32);
  }
}
