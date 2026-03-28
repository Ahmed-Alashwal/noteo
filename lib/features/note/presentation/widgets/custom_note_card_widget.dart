import 'package:flutter/material.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/screens/update_note_screen.dart';
import 'package:note_app/features/note/presentation/widgets/custom_note_card_content.dart';

class CustomNoteCardWidget extends StatelessWidget {
  final NoteEntity noteEntity;
  const CustomNoteCardWidget({super.key, required this.noteEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UpdateNoteScreen()),
        );
      },
      child:  CustomNoteCardBody(noteEntity: noteEntity),
    );
  }
}
