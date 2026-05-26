import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle get titleLarge => GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get titleMedium => GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get titleSmall => GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondary,
  );

  static TextStyle get inputText => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textInput,
  );

  static TextStyle get caption => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
  );
  static TextStyle get captionBold => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textTertiary,
  );

  static TextStyle get captionActive => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.yellowPrimary,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.yellowPrimary,
    decorationThickness: 2,
  );

  static TextStyle get option => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textGray,
  );

  // -----------
  static TextStyle get textButton => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static TextStyle get time => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.greenPrimary,
  );
}

class AppColors {
  static bool isDark = true;

  // Backgrounds
  static Color get bgPrimary => isDark ? const Color(0xFF121214) : const Color(0xFFF9FAFB);
  static Color get bgSecondary => isDark ? const Color(0xFF202024) : const Color(0xFFFFFFFF);
  static Color get bgTertiary => isDark ? const Color(0xFF29292E) : const Color(0xFFF3F4F6);
  static Color get bgDark => isDark ? const Color(0xFF1E1E1E) : const Color(0xFFE5E7EB);
  static Color get bgLight => isDark ? const Color(0xFF192922) : const Color(0xFFE8F5E9);
  static Color get bgSecondaryButton => isDark ? const Color(0xFF292619) : const Color(0xFFFEF9C3);
  static Color get bgError => isDark ? const Color(0xFF291719) : const Color(0xFFFFEBEE);

  // Borders & Dividers
  static Color get borderPrimary => isDark ? const Color(0xFF323238) : const Color(0xFFE4E4E7);
  static Color get borderSecondary => isDark ? const Color(0xFF121214) : const Color(0xFFF3F4F6);
  static Color get borderInput => isDark ? const Color.fromARGB(255, 58, 60, 70) : const Color(0xFFD1D5DB);

  // Brand Colors
  static const Color brandYellow = Color(0xFFF7DD43);
  static const Color brandYellowAlt = Color(0xFFFFCC00);
  static const Color yellowPrimary = Color(0xFFF7DD43);
  static const Color greenPrimary = Color(0xFF047C3F);

  // Text Colors
  static Color get textPrimary => isDark ? const Color(0xFFFFFFFF) : const Color(0xFF111827);
  static Color get textSecondary => isDark ? const Color(0xFFE1E1E6) : const Color(0xFF374151);
  static Color get textTertiary => isDark ? const Color(0xFFC4C4CC) : const Color(0xFF6B7280);
  static Color get textMuted => isDark ? const Color(0xFF8D8D99) : const Color(0xFF9CA3AF);
  static Color get textError => const Color(0xFFFF383C);
  static Color get textGray => isDark ? const Color(0xFF938F96) : const Color(0xFF4B5563);
  static Color get textDark => isDark ? const Color(0xFF71717B) : const Color(0xFF374151);
  static Color get textBlack => const Color(0xFF09090A);
  static Color get textInput => isDark ? const Color(0xFFBCBCBC) : const Color(0xFF111827);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color avatarBackground = Color.fromARGB(255, 43, 39, 116);
  static Color get surfaceInput => isDark ? const Color(0xFF292B3D) : const Color(0xFFF3F4F6);

  static const Color scaffoldDarkBackgroundColor = Color(0xFF05050D);
}
