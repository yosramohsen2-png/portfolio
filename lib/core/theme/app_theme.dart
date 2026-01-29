import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_dimensions.dart';

/// Application theme configuration
class AppTheme {
  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightBgBrandSolid,
        secondary: AppColors.lightBgBrandHover,
        surface: AppColors.lightBgPrimarySecondary,
        error: Color(0xFFDC3545),
        onPrimary: AppColors.lightTextPrimaryToggle,
        onSecondary: AppColors.lightTextPrimaryDefault,
        onSurface: AppColors.lightTextPrimaryDefault,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.lightBgPrimaryDefault,
      textTheme: AppTypography.textTheme(
        color: AppColors.lightTextPrimaryDefault,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBgPrimaryDefault,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.lightIconPrimaryDefault,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.lightTextPrimaryDefault,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightBgPrimarySecondary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBgBrandSolid,
          foregroundColor: AppColors.lightTextPrimaryToggle,
          elevation: 2,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing3xl,
            vertical: AppDimensions.spacingMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightBgPrimarySecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          borderSide: const BorderSide(
            color: AppColors.lightBorderPrimaryCards,
            width: AppDimensions.borderWidthXs,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          borderSide: const BorderSide(
            color: AppColors.lightBorderPrimaryDefault,
            width: AppDimensions.borderWidthSm,
          ),
        ),
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkBgBrandSolid,
        secondary: AppColors.darkBgBrandHover,
        surface: AppColors.darkBgPrimarySecondary,
        error: Color(0xFFDC3545),
        onPrimary: AppColors.darkTextPrimaryToggle,
        onSecondary: AppColors.darkTextPrimaryDefault,
        onSurface: AppColors.darkTextPrimaryDefault,
        onError: AppColors.darkTextPrimaryToggle,
      ),
      scaffoldBackgroundColor: AppColors.darkBgPrimaryDefault,
      textTheme: AppTypography.textTheme(
        color: AppColors.darkTextPrimaryDefault,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBgPrimaryDefault,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.darkIconPrimaryDefaultChange,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.darkTextPrimaryDefault,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkBgPrimarySecondary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBgBrandSolid,
          foregroundColor: AppColors.darkTextPrimaryToggle,
          elevation: 2,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing3xl,
            vertical: AppDimensions.spacingMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkBgPrimarySecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          borderSide: const BorderSide(
            color: AppColors.darkBorderPrimaryCards,
            width: AppDimensions.borderWidthXs,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          borderSide: const BorderSide(
            color: AppColors.darkBorderPrimaryDefault,
            width: AppDimensions.borderWidthSm,
          ),
        ),
      ),
    );
  }
}
