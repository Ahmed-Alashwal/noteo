import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/manager/create_note_cubit/create_note_cubit.dart';
import 'package:note_app/features/note/presentation/manager/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';
import 'package:note_app/features/note/presentation/manager/update_note_cubit/update_note_cubit.dart';

String? validateUsername(String input) {
  final bool isMatch = RegExp(r'^[A-Za-z_]{3,}').hasMatch(input.trim());
  return isMatch
      ? null
      : 'Enter first and last name (letters only, min 3 chars each)';
}

String? validateEmail(String input) {
  final bool isMatch = RegExp(
    r'^[a-zA-Z0-9_]+@gmail.com$',
  ).hasMatch(input.trim());
  return isMatch
      ? null
      : 'Enter a valid email address (e.g., name@example.com)';
}

String? validatePassword(String input) {
  final bool isMatch = RegExp(r'^[A-Za-z0-9]{6,}$').hasMatch(input.trim());
  return isMatch ? null : 'Min 6 characters, letters and numbers only';
}

// TFF = TextFormField
// this function will return NULL every time
// becuase we accepte any text for note's
// title and content.
String? noteTFFValidator(String input) {
  return null;
}

void validateWholeNoteForm(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required TextEditingController titleController,
  required TextEditingController contentController,
  String? noteId,
  required String message,
}) {
  if (formKey.currentState!.validate()) {
    if (message == AppString.kCreate) {
      context.read<CreateNoteCubit>().createNote(
        noteEntity: NoteEntity(
          id: uuid.v4(),
          title: titleController.text,
          content: contentController.text,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }
    if (message == AppString.kUpdate) {
      context.read<UpdateNoteCubit>().updateNote(
        updatedNoteEntity: NoteEntity(
          id: noteId!,
          title: titleController.text,
          content: contentController.text,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }
    context.read<FetchAllNotesCubit>().fetchAllNotes();
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
