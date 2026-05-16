import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  
  static final TextStyle titleLarge = GoogleFonts.atma(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle titleSmall = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle googleButton = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodyText = GoogleFonts.inter(
    fontSize: 16,
  );

  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textGray,
  );

  static final TextStyle captionActive = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColors.textGray,
  );

  static final TextStyle option = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textGray,
  );

  // -----------
  static final TextStyle textButton = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

class AppColors {
  // Backgrounds
  static const Color bgPrimary = Color(0xFF121214);
  static const Color bgSecondary = Color(0xFF202024);
  static const Color bgTertiary = Color(0xFF29292e);
  static const Color bgDark = Color(0xFF1e1e1e);

  // Borders & Dividers
  static const Color borderPrimary = Color(0xFF323238);
  static const Color borderSecondary = Color(0xFF121214);

  // Brand Colors
  static const Color brandYellow = Color(0xFFF7DD43);
  static const Color brandYellowAlt = Color(0xFFFFCC00);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFE1E1E6);
  static const Color textTertiary = Color(0xFFC4C4CC);
  static const Color textMuted = Color(0xFF8D8D99);
  static const Color textError = Color(0xFFFF383C);
  static const Color textGray = Color(0xFF938F96);
  static const Color textDark = Color(0xFF71717B);
  static const Color textBlack = Color(0xFF09090A);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color avatarBackground = Color.fromARGB(255, 43, 39, 116);
  static const Color surfaceInput = Color(0xFF292B3D);
  static const Color textInput = Color(0xFF8C8E9C);
  static const Color borderInput = Color.fromARGB(255, 58, 60, 70);

  static const Color yellowPrimary = Color(0xFFF7DD43);

  static const Color scaffoldDarkBackgroundColor = Color(0xFF05050D);
}