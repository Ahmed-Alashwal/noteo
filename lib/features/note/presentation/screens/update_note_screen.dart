import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/widgets/custom_update_note_body.dart';

class UpdateNoteScreen extends StatelessWidget {
  final NoteEntity noteEntity;
  const UpdateNoteScreen({super.key, required this.noteEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      appBar: const CustomAppBar(title: "Update Note"),
      body: CustomUpdateNoteScreenBody(noteEntity: noteEntity),
    );
  }
}
