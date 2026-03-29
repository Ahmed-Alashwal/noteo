import 'package:flutter/material.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/widgets/update_note_form.dart';

class CustomUpdateNoteScreenBody extends StatelessWidget {
  final NoteEntity noteEntity;
  const CustomUpdateNoteScreenBody({super.key, required this.noteEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.pAll12,
      child: UpdateNoteForm(noteEntity: noteEntity),
    );
  }
}
