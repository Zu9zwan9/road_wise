import 'package:flutter/material.dart';

/// Color scheme for RoadWise app based on design documentation
class AppColors {
  // Primary Colors
  static const Color mapleRed = Color(0xFFE63946);
  static const Color canadianBlue = Color(0xFF1D3557);
  static const Color skyBlue = Color(0xFF457B9D);

  // Neutral Colors
  static const Color offWhite = Color(0xFFF1FAEE);
  static const Color lightGray = Color(0xFFE5E5E5);
  static const Color mediumGray = Color(0xFFA8DADC);
  static const Color darkGray = Color(0xFF6C757D);
  static const Color nearBlack = Color(0xFF212529);

  // Semantic Colors
  static const Color successGreen = Color(0xFF28A745);
  static const Color warningYellow = Color(0xFFFFC107);
  static const Color errorRed = Color(0xFFDC3545);
  static const Color infoBlue = Color(0xFF17A2B8);

  // Dark Mode Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkModePrimaryText = Color(0xFFFFFFFF);
  static const Color darkModeSecondaryText = Color(0xFFB3B3B3);

  // Achievement Colors
  static const Color bronze = Color(0xFFCD7F32);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color gold = Color(0xFFFFD700);
  static const Color platinum = Color(0xFFE5E4E2);

  // Streak Colors
  static const Color streakDay1 = Color(0xFF66BB6A);
  static const Color streakDay3 = Color(0xFF26A69A);
  static const Color streakDay7 = Color(0xFF42A5F5);
  static const Color streakDay14 = Color(0xFF7E57C2);
  static const Color streakDay30Plus = Color(0xFFEC407A);

  // Private constructor to prevent instantiation
  AppColors._();
}
