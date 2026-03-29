import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/widgets/custom_note_card_body_center_side.dart';
import 'package:note_app/features/note/presentation/widgets/custom_note_card_body_right_side.dart';

class CustomNoteCardBody extends StatelessWidget {
  final NoteEntity noteEntity;
  const CustomNoteCardBody({super.key, required this.noteEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes.pV4,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: AppSizes.r8,
      ),
      child: Padding(
        padding: AppSizes.pAll16,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/happy_circle.svg"),
                  SizedBox(width: 24),
                  NoteCardBodyCenterSide(noteEntity: noteEntity),
                ],
              ),
            ),
            NoteCardBodyRightSide(noteEntity: noteEntity),
          ],
        ),
      ),
    );
  }
}
