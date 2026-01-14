import 'package:flutter/material.dart';

class AppTheme {
  static const _background = Color(0xFF0E0E11);
  static const _surface = Color(0xFF15151A);
  static const _border = Color(0xFF2A2A33);

  static const _textPrimary = Color(0xFFE6E6EB);
  static const _textSecondary = Color.fromARGB(255, 177, 177, 184);

  static const _accent = Color(0xFF5EEAD4); // parcimônia

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,

    // Background
    scaffoldBackgroundColor: _background,
    canvasColor: _background,

    // Fonte global
    fontFamily: 'JetBrainsMono',

    // Texto
    textTheme: const TextTheme(
      // Títulos discretos
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: _textPrimary,
        height: 1.3,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: _textPrimary,
      ),

      // Body
      bodyLarge: TextStyle(fontSize: 14, color: _textPrimary, height: 1.5),
      bodyMedium: TextStyle(fontSize: 13, color: _textSecondary, height: 1.5),
      bodySmall: TextStyle(fontSize: 12, color: _textSecondary),
    ),

    // Icons
    iconTheme: const IconThemeData(size: 20, color: _textSecondary),

    // Divider
    dividerColor: _border,

    // Cards  containers
    cardColor: _surface,

    // Links / interactions
    colorScheme: const ColorScheme.dark(
      surface: _surface,
      primary: _accent,
      secondary: _accent,
    ),

    // Ink / ripple discrete
    splashColor: _accent.withValues(),
    highlightColor: _accent.withValues(),
    hoverColor: _accent.withValues(),
  );
}
