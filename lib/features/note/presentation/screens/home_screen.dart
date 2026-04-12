import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
import 'package:note_app/core/widgets/custom_drawer.dart';
import 'package:note_app/core/widgets/custom_list_view_builder.dart';
import 'package:note_app/core/widgets/custom_spinner.dart';
import 'package:note_app/features/note/presentation/manager/delete_note_cubit/delete_note_cubit.dart';
import 'package:note_app/features/note/presentation/manager/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';
import 'package:note_app/features/note/presentation/widgets/custom_floating_action_button.dart';
import 'package:note_app/features/note/presentation/widgets/no_note_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FetchAllNotesCubit>().fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteNoteCubit, DeleteNoteState>(
      listener: (context, state) {
        if (state is DeleteNoteSuccess) {
          context
              .read<FetchAllNotesCubit>()
              .fetchAllNotes(); // triggered after success
          showSuccessSnackBar(context, message: "Note deleted successfully");
        }
        if (state is DeleteNoteFailure) {
          showErrorSnackBar(context, message: state.errMessage);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.bgSecondary,
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: BlocBuilder<FetchAllNotesCubit, FetchAllNotesState>(
          builder: (context, state) {
            if (state is FetchAllNotesLoading) {
              return const CustomSpinner(title: "Fetching your notes...");
            }
            if (state is FetchAllNotesFailure) {
              return Center(
                child: Padding(
                  padding: AppSizes.pAll12,
                  child: Container(
                    padding: AppSizes.pAll12,
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: AppSizes.r8,
                    ),
                    child: Text(
                      state.errMessage,
                      style: AppTextStyles.small12Bold,
                    ),
                  ),
                ),
              );
            }
            if (state is FetchAllNotesSuccess) {
              return state.notes.isNotEmpty
                  ? CustomListViewBuilder(notes: state.notes)
                  : const NoNoteWidget();
            } else {
              return const SizedBox();
            }
          },
        ),
        floatingActionButton: const CustomFloatingActionButton(),
      ),
    );
  }
}
