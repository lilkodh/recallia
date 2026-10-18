import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accent,
        onPrimary: AppColors.primaryText,
        surface: AppColors.surface,
        onSurface: AppColors.primaryText,
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.display,
        headlineMedium: AppTextStyles.headline,
        titleLarge: AppTextStyles.title,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.caption,
        labelLarge: AppTextStyles.button,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.primaryText,
          textStyle: AppTextStyles.button,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
