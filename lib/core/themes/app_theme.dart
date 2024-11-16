import 'package:flutter/material.dart';
import '../colors.dart';

class AppTheme {
  static ThemeData lightTheme(Color primaryColor) {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: AppColors.lightSecondary,
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
        onBackground: AppColors.lightOnBackground,
        onSurface: AppColors.lightOnSurface,
        onPrimary: AppColors.lightOnPrimary,
        onSecondary: AppColors.lightOnSecondary,
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
    );
  }

  static ThemeData darkTheme(Color primaryColor) {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: AppColors.darkSecondary,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        onBackground: AppColors.darkOnBackground,
        onSurface: AppColors.darkOnSurface,
        onPrimary: AppColors.darkOnPrimary,
        onSecondary: AppColors.darkOnSecondary,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
    );
  }

  static ThemeData pitchBlackTheme(Color primaryColor) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.pitchBlack,
      colorScheme: ColorScheme.dark().copyWith(
        primary: primaryColor,
        secondary: AppColors.darkSecondary,
        background: AppColors.pitchBlack,
        surface: AppColors.pitchSurface,
        onBackground: AppColors.pitchOnBackground,
        onSurface: AppColors.darkOnSurface,
        onPrimary: AppColors.darkOnPrimary,
        onSecondary: AppColors.pitchOnSecondary,
      ),
    );
  }
}
