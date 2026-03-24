import 'package:flutter/material.dart';
import 'package:note_app/features/note/presentation/screens/create_note_screen.dart';
import 'package:note_app/features/note/presentation/widgets/custom_note_card_content.dart';

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
      child: const CustomNoteCardBody(),
    );
  }
}
