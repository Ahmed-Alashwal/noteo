import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';

class CreateNoteForm extends StatelessWidget {
  const CreateNoteForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.titleController,
    required this.contentController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController titleController;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextFormField(
            autofocus: true,
            labelText: "Title",
            hintText: "Title...",
            controller: titleController,
            validator: (value) {
              return noteTFFValidator(data: value);
            },
          ),
          const Gap(12),
          CustomTextFormField(
            maxLines: 5,
            labelText: "Content",
            hintText: "Content...",
            controller: contentController,
            validator: (value) => noteTFFValidator(data: value),
          ),
          const Gap(24),
          CustomButton(
            label: "Save",
            hasShadow: true,
            onTap: () {
              validateWholeNoteForm(
                context,
                formKey: _formKey,
                titleController: titleController,
                contentController: contentController,
                message: "Created",
              );
            },
          ),
        ],
      ),
    );
  }
}
