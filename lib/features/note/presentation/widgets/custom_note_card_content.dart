import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/show_alert_dialog.dart';
import 'package:note_app/core/widgets/custom_date_time_widget.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/presentation/screens/update_note_screen.dart';
import 'package:note_app/features/note/presentation/widgets/custom_icon_button.dart';

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
                  Expanded(
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
                          style: AppTextStyles.small14Regular,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
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
                            builder: (context) => const UpdateNoteScreen(),
                          ),
                        );
                      },
                    ),
                    CustomIconButton(
                      backgroundColor: AppColors.bgLightRed,
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showAlertDialog(context, noteId: noteEntity.id!);
                      },
                    ),
                  ],
                ),
                CustomDateTimeWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
