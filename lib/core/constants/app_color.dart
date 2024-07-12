import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Light Theme
  static const Color primaryColor = Color(0xff7CC9F2);
  static const Color lightBgColor = Colors.white;
  static final Color lightCardColor =
      Colors.blueGrey.shade50; //Color(0xffFDFCFC);
  static const Color errorColor = Colors.redAccent;

  // Text
  static const Color lightTextColor = Color(0xff2C2C2C);
  static const Color lightSecondaryTextColor = Color(0xff9A9A9A);
  static const Color lightExtraSecondaryTextColor = Color(0xffC4C4C4);

  // Textfield
  static final Color lightSearchFillColor =
      Colors.blueGrey.shade50; //Color(0xffFDFCFC);
  static const Color lightCursorColor = primaryColor;
}
