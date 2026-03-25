import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.icon,
    this.backgroundColor,
    this.onPressed,
  });

  final Widget? icon;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: AppSizes.pAll8,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.bgSecondary,
          borderRadius: AppSizes.r8,
        ),
        child: icon!,
      ),
      color: AppColors.textPrimary,
    );
  }
}
