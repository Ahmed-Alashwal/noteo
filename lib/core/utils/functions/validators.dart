import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/manager/create_note_cubit/create_note_cubit.dart';
import 'package:note_app/features/note/presentation/manager/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';
import 'package:note_app/features/note/presentation/manager/update_note_cubit/update_note_cubit.dart';

void validateWholeNoteForm(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required TextEditingController titleController,
  required TextEditingController contentController,
  String? noteId,
  required String message,
}) {
  if (formKey.currentState!.validate()) {
    if (message == "Created") {
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
    if (message == "Updated") {
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

// TFF = TextFormField
String? noteTFFValidator({String? data}) {
  return data == null || data.isEmpty
      ? "This field should not be empty!"
      : null;
}
