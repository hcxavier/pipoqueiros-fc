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
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: AppFonts.textButton,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.surfaceInput,
        foregroundColor: colorDarkScheme.onSecondary,
        side: BorderSide(color: AppColors.borderInput, width: 2),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceInput,
      //hintStyle: AppStyles.bodyText.copyWith(color: AppColors.textInput),
      prefixIconColor: AppColors.textInput,
      suffixIconColor: AppColors.textInput,
      contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: AppColors.borderInput, width: 2),
      ),
      
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: AppColors.yellowPrimary, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: AppColors.textError, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: AppColors.textError, width: 2),
      ),

      //errorStyle: AppStyles.caption.copyWith(color: AppColors.onError),
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
}