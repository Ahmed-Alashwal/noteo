import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context, {
  required String message,
  required Color backgroundColor,
  String? icon,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message, style: AppTextStyles.small14Bold), //
          icon != null
              ? SvgPicture.asset(icon, width: 20, height: 20) //
              : const SizedBox(),
        ],
      ),
      backgroundColor: backgroundColor, //
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: AppSizes.r12),
      elevation: 0,
    ),
  );
}
