import 'package:flutter/material.dart';

class AppTheme {
  // Color Palette
  static const Color scaffoldBackgroundColor = Color(0xFFDEDEDE);
  static const Color primaryColor = Color(0xFFA62B1F);
  static const Color accentColor = Color(0xFF0477BF);
  static const Color warning = Color(0xFFDAF2A7);
  static const Color error = Color(0xFFF28A80);
  static const Color success = Color(0xFF73D98C);

  static ThemeData lightTheme() => ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        primaryColor: primaryColor,
      );
}
