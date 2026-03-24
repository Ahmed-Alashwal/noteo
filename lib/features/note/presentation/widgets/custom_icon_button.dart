import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.myIcon,
    this.myBackgroundColor,
    this.myController,
    this.myOnPressed,
  });

  final Widget? myIcon;
  final Color? myBackgroundColor;
  final TextEditingController? myController;
  final void Function()? myOnPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: myOnPressed,
      icon: Container(
        padding: AppSizes.pAll8,
        decoration: BoxDecoration(
          color: myBackgroundColor ?? AppColors.bgSecondary,
          borderRadius: AppSizes.r8,
        ),
        child: myIcon!,
      ),
      color: AppColors.textPrimary,
    );
  }
}
