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
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: scaffoldBackgroundColor),
          titleTextStyle:
              TextStyle(color: scaffoldBackgroundColor, fontSize: 20),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: scaffoldBackgroundColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: scaffoldBackgroundColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: scaffoldBackgroundColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: error, width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: scaffoldBackgroundColor),
          errorStyle:
              const TextStyle(color: error, fontWeight: FontWeight.bold),
        ),
      );
}
