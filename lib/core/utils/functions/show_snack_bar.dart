import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context, {
  required Color backgroundColor,
  required String icon,
  required String message,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: EdgeInsets.zero,
      content: Padding(
        padding: AppSizes.pH12,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(icon, width: 24, height: 24),
          title: Text(message, style: AppTextStyles.small12Bold),
        ),
      ),
      showCloseIcon: true,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: AppSizes.r12),
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
  BuildContext context, {
  required String message,
}) {
  return showSnackBar(
    context,
    backgroundColor: AppColors.success,
    icon: AppString.kHappyCircle,
    message: message,
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
  BuildContext context, {
  required String message,
}) {
  return showSnackBar(
    context,
    backgroundColor: AppColors.error,
    icon: AppString.kSadCircle,
    message: message,
  );
}
