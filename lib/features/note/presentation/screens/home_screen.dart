import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
import 'package:note_app/features/note/presentation/widgets/custom_note_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      appBar: const CustomAppBar(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const CustomNoteCardWidget();
        },
      ),
    );
  }
}
