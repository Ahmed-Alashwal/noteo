import 'package:flutter/material.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

class NoteCardBodyCenterSide extends StatelessWidget {
  const NoteCardBodyCenterSide({super.key, required this.noteEntity});

  final NoteEntity noteEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            noteEntity.title,
            style: AppTextStyles.h3,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            noteEntity.content,
            style: AppTextStyles.small12Regular,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
