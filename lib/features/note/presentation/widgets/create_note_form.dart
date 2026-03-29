import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/service_locator.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';
import 'package:note_app/features/note/data/repository/note_repository_impl.dart';
import 'package:note_app/features/note/domain/usecases/create_note_use_case.dart';
import 'package:note_app/features/note/presentation/manager/create_note_cubit/create_note_cubit.dart';

class CreateNoteForm extends StatefulWidget {
  const CreateNoteForm({super.key});

  @override
  State<CreateNoteForm> createState() => _CreateNoteFormState();
}

class _CreateNoteFormState extends State<CreateNoteForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNoteCubit(
        createNoteUseCase: CreateNoteUseCase(
          noteRepository: di.get<NoteRepositoryImpl>(),
        ),
      ),
      child: Builder(
        builder: (context) {
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteractionIfError,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFormField(
                  autofocus: true,
                  textStyle: AppTextStyles.normal16Regular,
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
                  textStyle: AppTextStyles.small14Regular,
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
        },
      ),
    );
  }
}
