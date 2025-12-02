import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiTheme {
  static const Color background = Color(0xFF050505); // Deep black for AMOLED
  static const Color surface = Color(0xFF121212);
  static const Color primary = Color(0xFF00E5FF); // Cyan Neon
  static const Color secondary = Color(0xFF7C4DFF); // Deep Purple
  static const Color accent = Color(0xFFFF4081); // Pink Neon
  static const Color textMain = Color(0xFFEEEEEE);
  static const Color textDim = Color(0xFFAAAAAA);

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        background: background,
        onPrimary: Colors.black,
        onSurface: textMain,
      ),
      textTheme: GoogleFonts.rajdhaniTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: textMain,
        displayColor: textMain,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardTheme(
        color: surface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: primary.withOpacity(0.2), width: 1),
        ),
      ),
    );
  }
}
