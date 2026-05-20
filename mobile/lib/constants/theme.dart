import 'styles.dart';
import 'package:flutter/material.dart';

class AppThemes {

  static final ColorScheme colorDarkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.yellowPrimary,
    onPrimary: AppColors.black,
    secondary: AppColors.borderInput,
    onSecondary: AppColors.white,
    primaryContainer: AppColors.white,
    secondaryContainer: AppColors.bgSecondary,
    tertiaryContainer: AppColors.bgTertiary,
    error: AppColors.textError,
    onError: AppColors.surfaceInput,
    surface: AppColors.surfaceInput,
    onSurface: AppColors.white,
    shadow: AppColors.black
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: colorDarkScheme,
    primaryColor: colorDarkScheme.primary,
    scaffoldBackgroundColor: AppColors.scaffoldDarkBackgroundColor,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorDarkScheme.primary,
        foregroundColor: colorDarkScheme.onPrimary,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: AppFonts.textButton,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.bgSecondary,
        foregroundColor: colorDarkScheme.onSecondary,
        side: BorderSide(color: colorDarkScheme.onSecondary, width: 1),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.bgSecondary,
      hintStyle: AppFonts.inputText.copyWith(color: AppColors.textMuted),
      prefixIconColor: AppColors.textInput,
      suffixIconColor: AppColors.textInput,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 18),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.borderPrimary, width: 1),
      ),
      
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.yellowPrimary, width: 1),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.textError, width: 1),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.textError, width: 1),
      ),

      errorStyle: AppFonts.caption.copyWith(color: AppColors.textError),
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
    primary: AppColors.yellowPrimary,
    onPrimary: AppColors.black,
    secondary: AppColors.borderInput,
    onSecondary: AppColors.black,
    primaryContainer: AppColors.bgSecondary,
    secondaryContainer: AppColors.surfaceInput,
    tertiaryContainer: AppColors.bgTertiary,
    error: AppColors.textError,
    onError: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.black,
    shadow: AppColors.black,
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: colorLightScheme,
    primaryColor: colorLightScheme.primary,
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
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
        backgroundColor: AppColors.white,
        foregroundColor: colorLightScheme.onSurface,
        side: const BorderSide(color: AppColors.borderPrimary, width: 1),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      hintStyle: AppFonts.inputText.copyWith(color: AppColors.textMuted),
      prefixIconColor: AppColors.textInput,
      suffixIconColor: AppColors.textInput,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 18),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.borderPrimary, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.yellowPrimary, width: 1),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.textError, width: 1),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.textError, width: 1),
      ),

      errorStyle: AppFonts.caption.copyWith(color: AppColors.textError),
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