import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get appTheme {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),
      primaryColor: AppColors.primary,
      textTheme: TextTheme(
        displayLarge: AppTypography.headLine1,
        displayMedium: AppTypography.headLine2,
        bodyLarge: AppTypography.textBody1,
        bodyMedium: AppTypography.textBody2,
        bodySmall: AppTypography.caption,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTypography.textBody2!.copyWith(color: AppColors.primary),
        hintStyle: AppTypography.textBody2!.copyWith(color: AppColors.grayMedium),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
        focusColor: AppColors.primary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTypography.headLine1,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
    );
  }
}
