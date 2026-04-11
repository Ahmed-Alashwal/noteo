import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/domain/usecases/fetch_all_notes_use_case.dart';

part 'fetch_all_notes_state.dart';

class FetchAllNotesCubit extends Cubit<FetchAllNotesState> {
  FetchAllNotesCubit({required this.fetchAllNotesUseCase})
    : super(FetchAllNotesInitial());

  final FetchAllNotesUseCase fetchAllNotesUseCase;

  Future<void> fetchAllNotes() async {
    emit(FetchAllNotesLoading());

    var result = await fetchAllNotesUseCase.call();

    result.fold(
      (failure) => emit(FetchAllNotesFailure(errMessage: failure.errMessage)),
      (notesList) => emit(FetchAllNotesSuccess(notes: notesList)),
    );
  }
}
