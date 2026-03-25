import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/show_alert_dialog.dart';
import 'package:note_app/core/widgets/custom_date_time_widget.dart';
import 'package:note_app/features/note/presentation/screens/update_note_screen.dart';
import 'package:note_app/features/note/presentation/widgets/custom_icon_button.dart';

class CustomNoteCardBody extends StatelessWidget {
  const CustomNoteCardBody({super.key});

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
            const Expanded(
              child: Row(
                children: [
                  Icon(Icons.note, color: AppColors.textPrimary, size: 32),
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text("Note Title", style: AppTextStyles.h3),
                        Text(
                          "Note Content",
                          style: AppTextStyles.small14Regular,
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
                        showAlertDialog(context);
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
