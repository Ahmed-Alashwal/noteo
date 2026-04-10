import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/get_text_direction.dart';

class CustomTextFormField extends StatefulWidget {
  final int? maxLines;
  final TextStyle? textStyle;
  final String? labelText;
  final String hintText;
  final bool? isObscureText;
  final Widget? icon;
  final bool? autofocus;
  final TextEditingController controller;
  final String? Function(String input) validator;
  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    this.textStyle,
    this.autofocus = false,
    this.labelText,
    required this.hintText,
    this.isObscureText,
    this.icon,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscureText ?? false,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required, you must fill it!";
        } else {
          return widget.validator(value);
        }
      },
      textDirection: getTextDirection(text: widget.controller.text),
      onChanged: (value) => setState(() {}),
      autofocus: widget.autofocus!,
      maxLines: widget.maxLines,
      style: widget.textStyle ?? AppTextStyles.small12Bold,
      cursorColor: AppColors.textPrimary,
      cursorErrorColor: AppColors.error,
      cursorHeight: 18,
      cursorWidth: 1.5,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.small12Regular,
        labelText: widget.labelText,
        labelStyle: AppTextStyles.small12Bold,
        suffixIcon: widget.icon,
        suffixIconColor: AppColors.textPrimary,
        errorStyle: const TextStyle(
          color: AppColors.error,
          fontSize: 8.5,
          fontWeight: FontWeight.w300,
        ),
        alignLabelWithHint: true,
        errorMaxLines: 3,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.bgWhite),
          borderRadius: AppSizes.r8,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.bgWhite),
          borderRadius: AppSizes.r8,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error),
          borderRadius: AppSizes.r8,
        ),
      ),
    );
  }
}
