import 'package:flutter/material.dart';
import 'package:note_app/features/note/presentation/widgets/custom_note_card_widget.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const CustomNoteCardWidget();
      },
    );
  }
}
