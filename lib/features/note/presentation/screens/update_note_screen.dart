import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
import 'package:note_app/features/note/presentation/widgets/custom_update_note_body.dart';

class UpdateNoteScreen extends StatelessWidget {
  const UpdateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgSecondary,
      appBar: CustomAppBar(title: "Update Note"),
      body: CustomUpdateNoteScreenBody(),
    );
  }
}
