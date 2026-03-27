import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSucessSnackBar(
  BuildContext context, {
  required String message,
}) {
  ScaffoldMessenger.of(context).clearSnackBars(); // sure about it?!
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(
            "assets/icons/happy_circle.svg",
            width: 24,
            height: 24,
          ), //
          Text(message, style: AppTextStyles.small14Bold),
        ],
      ),
      showCloseIcon: true,
      backgroundColor: AppColors.success,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: AppSizes.r12),
      elevation: 0,
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
  BuildContext context, {
  required String message,
}) {
  ScaffoldMessenger.of(context).clearSnackBars(); // sure about it?!
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(
            "assets/icons/sad_circle.svg",
            width: 24,
            height: 24,
          ), //
          Text(message, style: AppTextStyles.small14Bold),
        ],
      ),
      showCloseIcon: true,
      backgroundColor: AppColors.error,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: AppSizes.r12),
      elevation: 0,
    ),
  );
}
