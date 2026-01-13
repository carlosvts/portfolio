import 'package:flutter/material.dart';

class AppTheme {
  // Paleta base (low-level / sobria)
  static const _background = Color(0xFF0E0E11);
  static const _surface = Color(0xFF15151A);
  static const _border = Color(0xFF2A2A33);

  static const _textPrimary = Color(0xFFE6E6EB);
  static const _textSecondary = Color(0xFF9A9AA3);

  static const _accent = Color(0xFF5EEAD4); // usado com parcimônia

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,

    // Background geral
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

      // Corpo
      bodyLarge: TextStyle(fontSize: 14, color: _textPrimary, height: 1.5),
      bodyMedium: TextStyle(fontSize: 13, color: _textSecondary, height: 1.5),
      bodySmall: TextStyle(fontSize: 12, color: _textSecondary),
    ),

    // Ícones
    iconTheme: const IconThemeData(size: 20, color: _textSecondary),

    // Divisores / bordas
    dividerColor: _border,

    // Cards e containers
    cardColor: _surface,

    // Links / interações
    colorScheme: const ColorScheme.dark(
      surface: _surface,
      primary: _accent,
      secondary: _accent,
    ),

    // Ink / ripple discreto
    splashColor: _accent.withValues(),
    highlightColor: _accent.withValues(),
    hoverColor: _accent.withValues(),
  );
}
