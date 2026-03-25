import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/features/note/presentation/screens/create_note_screen.dart';

class NoNoteWidget extends StatelessWidget {
  const NoNoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateNoteScreen(),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/pen.svg",
                width: 40,
                height: 40,
              ),
              const Gap(12),
              const Text(
                "No notes yet. Tap to add a note",
                style: AppTextStyles.small14Regular,
              ),
            ],
          ),
        ),
      );
  }
}
