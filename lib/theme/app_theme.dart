import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Brand Palette ──────────────────────────────────────────────
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF4B44CC);
  static const Color secondary = Color(0xFFFF6584);
  static const Color accent = Color(0xFF43E97B);
  static const Color accentBlue = Color(0xFF38F9D7);

  // ── Backgrounds ────────────────────────────────────────────────
  static const Color bgDark = Color(0xFF0D0D1A);
  static const Color bgCard = Color(0xFF16162A);
  static const Color bgCardLight = Color(0xFF1E1E35);

  // ── Text ───────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFF0F0FF);
  static const Color textSecondary = Color(0xFFB0AECF);
  static const Color textMuted = Color(0xFF6E6C8E);

  // ── Gradients ──────────────────────────────────────────────────
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0D0D1A), Color(0xFF1A1040), Color(0xFF0D0D1A)],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, Color(0xFF8B80FF)],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E1E38), Color(0xFF16162A)],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, accentBlue],
  );

  // ── Category Colors ────────────────────────────────────────────
  static Color categoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'motivation':
        return const Color(0xFFFF6B6B);
      case 'wisdom':
        return const Color(0xFFFFD93D);
      case 'life':
        return const Color(0xFF6BCB77);
      case 'success':
        return const Color(0xFF4D96FF);
      case 'perseverance':
        return const Color(0xFFFF922B);
      case 'love':
        return const Color(0xFFFF6584);
      case 'dreams':
        return const Color(0xFFC77DFF);
      case 'courage':
        return const Color(0xFFFF4757);
      case 'humor':
        return const Color(0xFFECCC68);
      case 'philosophy':
        return const Color(0xFF70A1FF);
      case 'adventure':
        return const Color(0xFF7BED9F);
      case 'mindset':
        return const Color(0xFFA29BFE);
      case 'resilience':
        return const Color(0xFFE17055);
      case 'gratitude':
        return const Color(0xFF00CEC9);
      default:
        return primary;
    }
  }

  // ── ThemeData ──────────────────────────────────────────────────
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bgDark,
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: bgCard,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
