import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final int? maxLines;
  final String labelText;
  final String hintText;
  final bool? autofocus;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    this.autofocus = false,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autofocus: autofocus!,
      maxLines: maxLines,
      style: AppTextStyles.small14Regular,
      cursorColor: AppColors.textPrimary,
      cursorErrorColor: AppColors.error,
      cursorHeight: 18,
      cursorWidth: 1.5,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.small14Regular,
        labelText: labelText,
        labelStyle: AppTextStyles.small14Bold,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bgWhite),
          borderRadius: AppSizes.r8,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bgWhite),
          borderRadius: AppSizes.r8,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
          borderRadius: AppSizes.r8,
        ),
      ),
    );
  }
}
