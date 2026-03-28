import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/features/note/presentation/manager/delete_note_cubit/delete_note_cubit.dart';
import 'package:note_app/features/note/presentation/manager/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';

Future<dynamic> showAlertDialog(
  BuildContext context, {
  required String noteId,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.bgPrimary,
        title: const Row(
          spacing: 8,
          children: [
            Icon(Icons.delete, color: AppColors.bgLightRed, size: 28),
            Text("Confirm Deletion", style: AppTextStyles.h1),
          ],
        ),
        content: const Text(
          "Are you sure you want to delete this note? This action cannot be undone.",
          style: AppTextStyles.normal16Regular,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                label: "Cancel",
                backgroundColor: AppColors.bgSecondary,
                onTap: () {
                  Feedback.forTap(context); // Triggers sound/vibration
                  Navigator.pop(context);
                },
              ),
              CustomButton(
                label: "Deletion",
                backgroundColor: AppColors.error,
                onTap: () {
                  Feedback.forTap(context); // Triggers sound/vibration
                  context.read<DeleteNoteCubit>().deleteNote(noteId: noteId);
                  context.read<FetchAllNotesCubit>().fetchAllNotes();
                  showSucessSnackBar(
                    context,
                    message: "Note deleted successfully",
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
