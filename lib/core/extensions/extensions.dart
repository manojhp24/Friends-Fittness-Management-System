import 'package:flutter/material.dart';
import '../config/app_sizes.dart';

extension ResponsiveText on TextStyle {
  // Always scale text size
  TextStyle get responsive =>
      copyWith(fontSize: (fontSize ?? 14) * AppSizes.textScale);

  TextStyle get semiBold =>
      responsive.copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold =>
      responsive.copyWith(fontWeight: FontWeight.w700);

  TextStyle get extraBold =>
      responsive.copyWith(fontWeight: FontWeight.w800);
}
