import 'package:flutter/material.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/features/note/presentation/widgets/update_note_form.dart';

class CustomUpdateNoteScreenBody extends StatefulWidget {
  const CustomUpdateNoteScreenBody({super.key});

  @override
  State<CustomUpdateNoteScreenBody> createState() =>
      _CustomUpdateNoteScreenBodyState();
}

class _CustomUpdateNoteScreenBodyState
    extends State<CustomUpdateNoteScreenBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.pAll12,
      child: UpdateNoteForm(
        formKey: _formKey,
        titleController: titleController,
        contentController: contentController,
      ),
    );
  }
}
