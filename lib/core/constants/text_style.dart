import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';

abstract class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.txtPrimary,
  );

  static const TextStyle normal16Regular = TextStyle(
    fontSize: 16,
    color: AppColors.txtPrimary,
  );
  static const TextStyle normal16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.txtPrimary,
  );

  static const TextStyle small14Regular = TextStyle(
    fontSize: 14,
    color: AppColors.txtPrimary,
  );
  static const TextStyle small14Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.txtPrimary,
  );

  static const TextStyle verySmall12Regular = TextStyle(
    fontSize: 12,
    color: AppColors.txtPrimary,
  );
  static const TextStyle verySmall12Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.txtPrimary,
  );
}
