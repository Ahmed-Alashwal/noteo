import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
import 'package:note_app/core/widgets/custom_list_view_builder.dart';
import 'package:note_app/features/note/presentation/widgets/custom_floating_action_button.dart';
import 'package:note_app/features/note/presentation/widgets/no_note_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgSecondary,
      appBar: CustomAppBar(),
      body: 1 != 1 ? NoNoteWidget() : CustomListViewBuilder(),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
