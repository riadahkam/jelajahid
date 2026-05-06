import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF0D7377);
  static const Color primaryLight = Color(0xFF14919B);
  static const Color primaryDark = Color(0xFF095456);

  // Accent / Secondary
  static const Color accent = Color(0xFFFF6B35);
  static const Color accentLight = Color(0xFFFF8A5C);

  // Background (Dark theme)
  static const Color background = Color(0xFF0A1628);
  static const Color surface = Color(0xFF132039);
  static const Color surfaceLight = Color(0xFF1B2D4F);
  static const Color card = Color(0xFF162544);

  // Text
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textHint = Color(0xFF6B7D8E);

  // Status
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFB74D);
  static const Color error = Color(0xFFEF5350);

  // Star rating
  static const Color star = Color(0xFFFFD700);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0D7377), Color(0xFF14919B), Color(0xFF31C5CC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFFF8A5C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF162544), Color(0xFF1B2D4F)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient overlayGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xCC0A1628)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
