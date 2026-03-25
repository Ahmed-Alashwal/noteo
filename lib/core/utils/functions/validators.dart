import 'package:flutter/material.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';

void validateWholeNoteForm(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required TextEditingController titleController,
  required TextEditingController contentController,
  required String message,
}) {
  if (formKey.currentState!.validate()) {
    showSucessSnackBar(context, message: "Note $message successfully.");
    titleController.clear();
    contentController.clear();
    Navigator.pop(context);
  } else {
    showErrorSnackBar(
      context,
      message: "${message.substring(0, 6)} note error",
    );
  }
}

// TFF = TextFormField
String? noteTFFValidator({String? data}) {
  return data == null || data.isEmpty
      ? "This field should not be empty!"
      : null;
}
