import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

class CustomUpdateNoteFormBody extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final NoteEntity noteEntity;
  const CustomUpdateNoteFormBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.noteEntity,
  }) : _formKey = formKey;

  @override
  State<CustomUpdateNoteFormBody> createState() =>
      _CustomUpdateNoteFormBodyState();
}

class _CustomUpdateNoteFormBodyState extends State<CustomUpdateNoteFormBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.noteEntity.title;
    contentController.text = widget.noteEntity.content;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextFormField(
          autofocus: true,
          textStyle: AppTextStyles.normal14Regular,
          labelText: "Title",
          hintText: "New title...",
          controller: titleController,
          validator: noteTFFValidator,
        ),
        const Gap(12),
        CustomTextFormField(
          maxLines: 5,
          textStyle: AppTextStyles.small12Regular,
          labelText: "Content",
          hintText: "New content...",
          controller: contentController,
          validator: noteTFFValidator,
        ),
        const Gap(24),
        CustomButton(
          label: AppString.kUpdate,
          hasShadow: true,
          onTap: () {
            validateWholeNoteForm(
              context,
              formKey: widget._formKey,
              titleController: titleController,
              contentController: contentController,
              noteId: widget.noteEntity.id,
              message: AppString.kUpdate,
            );
          },
        ),
      ],
    );
  }
}
