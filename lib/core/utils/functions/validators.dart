import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';

void validateWholeNoteForm(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required TextEditingController titleController,
  required TextEditingController contentController,
  required String message,
}) {
  if (formKey.currentState!.validate()) {
    showSnackBar(
      context,
      message: "Note $message Successfully.",
      backgroundColor: AppColors.success,
      icon: "assets/icons/happy_circle.svg",
    );
    titleController.clear();
    contentController.clear();
    Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
  } else {
    showSnackBar(
      context,
      message: "${message.substring(0, 6)} Error",
      backgroundColor: AppColors.error,
      icon: "assets/icons/sad_circle.svg",
    );
  }
}

String? noteTFFValidator({String? data}) {
  return data == null || data.isEmpty
      ? "This field should not be empty!"
      : null;
}
