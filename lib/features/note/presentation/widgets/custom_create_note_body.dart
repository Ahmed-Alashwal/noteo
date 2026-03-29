import 'package:flutter/material.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/features/note/presentation/widgets/create_note_form.dart';

class CustomCreateNoteBody extends StatelessWidget {
  const CustomCreateNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.pAll12, 
      child: const CreateNoteForm()
      );
  }
}
