import 'package:flutter/material.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/widgets/custom_note_card_widget.dart';

class CustomListViewBuilder extends StatelessWidget {
  final List<NoteEntity> notes;
  const CustomListViewBuilder({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return CustomNoteCardWidget(noteEntity: notes[index]);
      },
    );
  }
}
