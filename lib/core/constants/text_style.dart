import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';

abstract class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle normal14Regular = TextStyle(
    fontSize: 14,
    color: AppColors.textPrimary,
  );
  static const TextStyle normal14Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle small12Regular = TextStyle(
    fontSize: 12,
    color: AppColors.textPrimary,
  );
  static const TextStyle small12Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle verySmall10Regular = TextStyle(
    fontSize: 10,
    color: AppColors.textPrimary,
  );
  static const TextStyle verySmall10Bold = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );
}
