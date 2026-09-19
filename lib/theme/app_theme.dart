import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Wooden bookshelf palette
  static const Color woodDark = Color(0xFF1A0F08);
  static const Color woodMid = Color(0xFF3A2418);
  static const Color woodLight = Color(0xFF5C3826);
  static const Color shelfEdge = Color(0xFF6B4423);

  // Accents
  static const Color goldAccent = Color(0xFFD4A574);
  static const Color crimsonReading = Color(0xFF8B3A3A);
  static const Color forestCompleted = Color(0xFF2D5A3D);
  static const Color warmLens = Color(0xFFC4956C);

  // Text
  static const Color textPrimary = Color(0xFFF5E6D3);
  static const Color textSecondary = Color(0xFFC4A57B);
  static const Color textMuted = Color(0xFF8B7355);
}

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.woodDark,
    primaryColor: AppColors.goldAccent,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.goldAccent,
      secondary: AppColors.warmLens,
      surface: AppColors.woodMid,
      background: AppColors.woodDark,
    ),
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    ).apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
  );
}
