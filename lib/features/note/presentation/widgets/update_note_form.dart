import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

class UpdateNoteForm extends StatefulWidget {
  final NoteEntity noteEntity;
  const UpdateNoteForm({super.key, required this.noteEntity});

  @override
  State<UpdateNoteForm> createState() => _UpdateNoteFormState();
}
class _UpdateNoteFormState extends State<UpdateNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.noteEntity.title;
    contentController.text = widget.noteEntity.content;

    return Form(
      key:  _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextFormField(
            autofocus: true,
            labelText: "Title",
            hintText: "New title...",
            controller:  titleController,
            validator: (value) {
              return noteTFFValidator(data: value);
            },
          ),
          const Gap(12),
          CustomTextFormField(
            maxLines: 5,
            labelText: "Content",
            hintText: "New content...",
            controller:  contentController,
            validator: (value) {
              return noteTFFValidator(data: value);
            },
          ),
          const Gap(24),
          CustomButton(
            label: "Update",
            hasShadow: true,
            onTap: () {
              validateWholeNoteForm(
                context,
                formKey:  _formKey,
                titleController:  titleController,
                contentController:  contentController,
                message: "Updated",
              );
            },
          ),
        ],
      ),
    );
  }
}
