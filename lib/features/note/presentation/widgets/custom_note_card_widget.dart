import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/custom_date_time_widget.dart';
import 'package:note_app/features/note/presentation/screens/create_note_screen.dart';
import 'package:note_app/features/note/presentation/screens/update_note_screen.dart';
import 'package:note_app/features/note/presentation/widgets/custom_icon_button.dart';

class CustomNoteCardWidget extends StatelessWidget {
  const CustomNoteCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateNoteScreen()),
        );
      },
      child: Container(
        padding: AppSizes.pV4,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                    Icon(Icons.note, color: AppColors.textPrimary, size: 32),
                    const SizedBox(width: 24),
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
                        myIcon: Icon(Icons.edit),
                        myOnPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpdateNoteScreen(),
                            ),
                          );
                        },
                      ),
                      CustomIconButton(
                        myBackgroundColor: AppColors.bgLightRed,
                        myIcon: Icon(Icons.delete),
                        myOnPressed: () {},
                      ),
                    ],
                  ),
                  CustomDateTimeWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
