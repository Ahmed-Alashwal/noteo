import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';
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
            validator: (value) {
              return noteTFFValidator(data: value);
            },
          ),
          const Gap(24),
          CustomButton(
            label: "Save",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                showSnackBar(
                  context,
                  message: "Success",
                  backgroundColor: AppColors.success,
                  icon: "assets/icons/happy_circle.svg",
                );
                titleController.clear();
                contentController.clear();
                Navigator.pop(context);
              } else {
                showSnackBar(
                  context,
                  message: "Error",
                  backgroundColor: AppColors.error,
                  icon: "assets/icons/sad_circle.svg",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
