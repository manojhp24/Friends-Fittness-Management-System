import 'package:flutter/material.dart';


extension ResponsiveText on TextStyle {
  TextStyle get responsive => this;

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
}
