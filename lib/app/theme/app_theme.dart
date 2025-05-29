import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Brand Colors
  static const Color primaryColor = Color(0xFF2E7DFF); // Blue
  static const Color secondaryColor = Color(0xFF4ECB71); // Green
  static const Color accentColor = Color(0xFFFF9500); // Orange
  static const Color errorColor = Color(0xFFFF3B30); // Red

  // Neutral Colors
  static const Color darkColor = Color(0xFF1C1C1E);
  static const Color mediumColor = Color(0xFF8E8E93);
  static const Color lightColor = Color(0xFFF2F2F7);
  static const Color whiteColor = Color(0xFFFFFFFF);

  // Gamification Colors
  static const Color goldColor = Color(0xFFFFD700);
  static const Color silverColor = Color(0xFFC0C0C0);
  static const Color bronzeColor = Color(0xFFCD7F32);

  // Text Styles
  static TextStyle get headlineLarge => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      );

  static TextStyle get headlineMedium => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      );

  static TextStyle get headlineSmall => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleLarge => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMedium => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get bodyLarge => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get bodySmall => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      );

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
        background: whiteColor,
        surface: lightColor,
      ),
      scaffoldBackgroundColor: whiteColor,
      appBarTheme: AppBarTheme(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: titleLarge.copyWith(color: darkColor),
        iconTheme: const IconThemeData(color: darkColor),
      ),
      cardColor: whiteColor,
      cardElevation: 2,
      cardShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: whiteColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: titleMedium,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: titleMedium,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: titleMedium,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorColor),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: bodyMedium.copyWith(color: mediumColor),
      ),
      textTheme: TextTheme(
        headlineLarge: headlineLarge.copyWith(color: darkColor),
        headlineMedium: headlineMedium.copyWith(color: darkColor),
        headlineSmall: headlineSmall.copyWith(color: darkColor),
        titleLarge: titleLarge.copyWith(color: darkColor),
        titleMedium: titleMedium.copyWith(color: darkColor),
        bodyLarge: bodyLarge.copyWith(color: darkColor),
        bodyMedium: bodyMedium.copyWith(color: darkColor),
        bodySmall: bodySmall.copyWith(color: darkColor),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: primaryColor,
        brightness: Brightness.light,
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
        background: darkColor,
        surface: Color(0xFF2C2C2E),
      ),
      scaffoldBackgroundColor: darkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: darkColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: titleLarge.copyWith(color: whiteColor),
        iconTheme: const IconThemeData(color: whiteColor),
      ),
      cardColor: const Color(0xFF2C2C2E),
      cardElevation: 0,
      cardShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: whiteColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: titleMedium,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: titleMedium,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: titleMedium,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorColor),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: bodyMedium.copyWith(color: mediumColor),
      ),
      textTheme: TextTheme(
        headlineLarge: headlineLarge.copyWith(color: whiteColor),
        headlineMedium: headlineMedium.copyWith(color: whiteColor),
        headlineSmall: headlineSmall.copyWith(color: whiteColor),
        titleLarge: titleLarge.copyWith(color: whiteColor),
        titleMedium: titleMedium.copyWith(color: whiteColor),
        bodyLarge: bodyLarge.copyWith(color: whiteColor),
        bodyMedium: bodyMedium.copyWith(color: whiteColor),
        bodySmall: bodySmall.copyWith(color: whiteColor),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: primaryColor,
        brightness: Brightness.dark,
      ),
    );
  }
}
