import 'package:flutter/material.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';

class CustomEmailTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const CustomEmailTextFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textStyle: AppTextStyles.normal14Regular,
      hintText: "Email...",
      controller: controller,
      validator: validateEmail,
    );
  }
}
