import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const CustomButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSizes.pAll12,
        width: 96,
        decoration: BoxDecoration(
          color: AppColors.bgPrimary,
          borderRadius: AppSizes.r8,
          boxShadow: [
            BoxShadow(
              color: AppColors.bgWhite,
              blurRadius: 12,
              offset: Offset(2, 2),
              spreadRadius: -2,
            ),
          ],
        ),
        child: Center(child: Text("Save", style: AppTextStyles.normal16Bold)),
      ),
    );
  }
}
