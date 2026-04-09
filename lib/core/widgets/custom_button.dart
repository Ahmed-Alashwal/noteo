import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final bool? hasShadow;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    required this.label,
    this.backgroundColor,
    this.hasShadow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSizes.pAll12,
        // width: 96,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.bgPrimary,
          borderRadius: AppSizes.r8,
          boxShadow: hasShadow == false
              ? null
              : [
                  const BoxShadow(
                    color: AppColors.bgWhite,
                    blurRadius: 12,
                    offset: Offset(2, 2),
                    spreadRadius: -2,
                  ),
                ],
        ),
        child: Center(child: Text(label, style: AppTextStyles.small12Regular)),
      ),
    );
  }
}
