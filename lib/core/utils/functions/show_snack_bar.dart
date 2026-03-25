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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message, style: AppTextStyles.small14Bold),
          SvgPicture.asset(
            "assets/icons/happy_circle.svg",
            width: 20,
            height: 20,
          ), //
        ],
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message, style: AppTextStyles.small14Bold),
          SvgPicture.asset(
            "assets/icons/sad_circle.svg",
            width: 20,
            height: 20,
          ), //
        ],
      ),
      backgroundColor: AppColors.error,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: AppSizes.r12),
      elevation: 0,
    ),
  );
}
