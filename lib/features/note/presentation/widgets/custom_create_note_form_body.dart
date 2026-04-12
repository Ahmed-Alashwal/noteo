import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';

class CustomCreateNoteFormBody extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  const CustomCreateNoteFormBody({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  @override
  State<CustomCreateNoteFormBody> createState() =>
      _CustomCreateNoteFormBodyState();
}

class _CustomCreateNoteFormBodyState extends State<CustomCreateNoteFormBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextFormField(
          autofocus: true,
          textStyle: AppTextStyles.normal14Regular,
          labelText: "Title",
          hintText: "Title...",
          controller: titleController,
          validator: noteTFFValidator,
        ),
        const Gap(12),
        CustomTextFormField(
          maxLines: 5,
          textStyle: AppTextStyles.small12Regular,
          labelText: "Content",
          hintText: "Content...",
          controller: contentController,
          validator: noteTFFValidator,
        ),
        const Gap(24),
        CustomButton(
          label: "Save",
          hasShadow: true,
          onTap: () {
            validateWholeNoteForm(
              context,
              formKey: widget._formKey,
              titleController: titleController,
              contentController: contentController,
              message: AppString.kCreate,
            );
          },
        ),
      ],
    );
  }
}
