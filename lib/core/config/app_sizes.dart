import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  // base screen width used for scale
  static const double _designWidth = 375.0;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Layout padding
  static double screenPadding(BuildContext context) =>
      screenWidth(context) * 0.04;

  static double cardPadding(BuildContext context) =>
      screenWidth(context) * 0.04;

  static double sectionSpace(BuildContext context) =>
      screenHeight(context) * 0.02;

  // Spacing variants
  static double spaceS(BuildContext context) =>
      screenHeight(context) * 0.012;

  static double spaceM(BuildContext context) =>
      screenHeight(context) * 0.02;

  static double spaceL(BuildContext context) =>
      screenHeight(context) * 0.03;

  // Border radius
  static double radius(BuildContext context) =>
      screenWidth(context) * 0.03;

  // Avatar size
  static double avatarSize(BuildContext context) =>
      screenWidth(context) * 0.12;

  // Text scale based on screen width
  static double textScale(BuildContext context) {
    double scale = screenWidth(context) / _designWidth;
    return scale.clamp(0.85, 1.2);
  }

  // Icon size responsive (general purpose)
  static double iconSize(BuildContext context) {
    double scale = screenWidth(context) / _designWidth;
    return (24 * scale).clamp(18, 32);
  }

  // Icon size for input fields (smaller, more proportional)
  static double inputIconSize(BuildContext context) {
    double scale = screenWidth(context) / _designWidth;
    return (20 * scale).clamp(16, 24);
  }

  // Icon size for buttons
  static double buttonIconSize(BuildContext context) {
    double scale = screenWidth(context) / _designWidth;
    return (22 * scale).clamp(18, 28);
  }

  // Icon size for large/primary actions
  static double largeIconSize(BuildContext context) {
    double scale = screenWidth(context) / _designWidth;
    return (28 * scale).clamp(24, 36);
  }

  static double responsiveAspectRatio(BuildContext context, {double heightFactor = 0.22}) {
    final width = screenWidth(context);
    final tileWidth = (width / 2) - (screenWidth(context) * 0.04);

    final tileHeight = screenHeight(context) * heightFactor;

    return tileWidth / tileHeight;
  }

}