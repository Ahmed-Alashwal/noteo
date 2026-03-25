import 'package:flutter/material.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/features/note/presentation/widgets/create_note_form.dart';

class CustomCreateNoteBody extends StatefulWidget {
  const CustomCreateNoteBody({super.key});

  @override
  State<CustomCreateNoteBody> createState() => _CustomCreateNoteBodyState();
}

class _CustomCreateNoteBodyState extends State<CustomCreateNoteBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.pAll12,
      child: CreateNoteForm(
        formKey: _formKey,
        titleController: titleController,
        contentController: contentController,
      ),
    );
  }
}
