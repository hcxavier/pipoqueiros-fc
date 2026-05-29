import 'package:mobile/constants/styles.dart';
import 'package:flutter/material.dart';

class AppThemes {

  static final ColorScheme colorDarkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: const Color(0xFFF7DD43), // brandYellow
    onPrimary: const Color(0xFF09090A), // textBlack
    secondary: const Color(0xFF323238), // borderPrimary
    onSecondary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFFFFFFFF),
    secondaryContainer: const Color(0xFF202024), // bgSecondary
    tertiaryContainer: const Color(0xFF29292E), // bgTertiary
    error: const Color(0xFFFF383C), // textError
    onError: const Color(0xFF292B3D),
    surface: const Color(0xFF292B3D), // surfaceInput
    onSurface: const Color(0xFFFFFFFF),
    shadow: const Color(0xFF000000),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: colorDarkScheme,
    primaryColor: colorDarkScheme.primary,
    scaffoldBackgroundColor: const Color(0xFF05050D), // scaffoldDarkBackgroundColor

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorDarkScheme.primary,
        foregroundColor: colorDarkScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: AppFonts.textButton,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFF202024),
        foregroundColor: colorDarkScheme.onSecondary,
        side: BorderSide(color: colorDarkScheme.onSecondary, width: 1),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF202024),
      hintStyle: AppFonts.inputText.copyWith(color: const Color(0xFF8D8D99)),
      prefixIconColor: const Color(0xFFBCBCBC),
      suffixIconColor: const Color(0xFFBCBCBC),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFF323238), width: 1),
      ),
      
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFF7DD43), width: 1),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFFF383C), width: 1),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFFF383C), width: 1),
      ),

      errorStyle: AppFonts.caption.copyWith(color: const Color(0xFFFF383C)),
    ),

    cardTheme: CardThemeData(
      color: colorDarkScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),

    useMaterial3: true,
  );

  static final ColorScheme colorLightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xFFF7DD43), // brandYellow
    onPrimary: const Color(0xFF09090A), // textBlack
    secondary: const Color(0xFFD1D5DB), // borderInput
    onSecondary: const Color(0xFF111827), // textPrimary
    tertiary: const Color(0xFF047C3F), // greenPrimary
    primaryContainer: const Color(0xFFFFFFFF),
    secondaryContainer: const Color(0xFFF3F4F6),
    tertiaryContainer: const Color(0xFFE5E7EB),
    error: const Color(0xFFFF383C),
    onError: const Color(0xFFFFFFFF),
    surface: const Color(0xFFFFFFFF),
    onSurface: const Color(0xFF111827),
    shadow: const Color(0xFF9CA3AF),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: colorLightScheme,
    primaryColor: colorLightScheme.primary,
    scaffoldBackgroundColor: const Color(0xFFF9FAFB), // Soft beautiful light background

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF111827)),
      titleTextStyle: TextStyle(color: Color(0xFF111827), fontSize: 18, fontWeight: FontWeight.bold),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorLightScheme.primary,
        foregroundColor: colorLightScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: AppFonts.textButton,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: colorLightScheme.onSurface,
        side: const BorderSide(color: Color(0xFFE4E4E7), width: 1),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFFFFFFF),
      hintStyle: AppFonts.inputText.copyWith(color: const Color(0xFF9CA3AF)),
      prefixIconColor: const Color(0xFF6B7280),
      suffixIconColor: const Color(0xFF6B7280),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFE4E4E7), width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFF7DD43), width: 1),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFFF383C), width: 1),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFFF383C), width: 1),
      ),

      errorStyle: AppFonts.caption.copyWith(color: const Color(0xFFFF383C)),
    ),

    cardTheme: CardThemeData(
      color: colorLightScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),

    useMaterial3: true,
  );
}