import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
import 'package:note_app/core/widgets/custom_list_view_builder.dart';
import 'package:note_app/core/widgets/custom_spinner.dart';
import 'package:note_app/features/note/presentation/manager/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';
import 'package:note_app/features/note/presentation/widgets/custom_floating_action_button.dart';
import 'package:note_app/features/note/presentation/widgets/no_note_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      appBar: CustomAppBar(),
      body: BlocBuilder<FetchAllNotesCubit, FetchAllNotesState>(
        builder: (context, state) {
          if (state is FetchAllNotesLoading) {
            return const CustomSpinner(title: "Fetching your notes...");
          }
          if (state is FetchAllNotesFailure) {
            return Center(
              child: Container(
                padding: AppSizes.pAll12,
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: AppSizes.r8,
                ),
                child: Text(state.errMessage, style: AppTextStyles.small14Bold),
              ),
            );
          }
          if (state is FetchAllNotesSuccess) {
            return state.notes.isNotEmpty
                ? CustomListViewBuilder(notes: state.notes)
                : NoNoteWidget();
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
