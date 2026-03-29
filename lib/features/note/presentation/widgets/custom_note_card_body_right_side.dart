import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/utils/functions/show_alert_dialog.dart';
import 'package:note_app/core/widgets/custom_date_time_widget.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/screens/update_note_screen.dart';
import 'package:note_app/features/note/presentation/widgets/custom_icon_button.dart';

class NoteCardBodyRightSide extends StatelessWidget {
  final NoteEntity noteEntity;

  const NoteCardBodyRightSide({super.key, required this.noteEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomIconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UpdateNoteScreen(noteEntity: noteEntity),
                  ),
                );
              },
            ),
            CustomIconButton(
              backgroundColor: AppColors.bgLightRed,
              icon: const Icon(Icons.delete),
              onPressed: () {
                showAlertDialog(context, noteId: noteEntity.id);
              },
            ),
          ],
        ),
        CustomDateTimeWidget(updatedtime: noteEntity.updatedAt),
      ],
    );
  }
}
