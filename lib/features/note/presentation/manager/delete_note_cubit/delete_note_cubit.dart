import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/note/domain/usecases/delete_note_use_case.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit({required this.deleteNoteUseCase})
    : super(DeleteNoteInitial());

  final DeleteNoteUseCase deleteNoteUseCase;

  Future<void> deleteNote({required String noteId}) async {
    emit(DeleteNoteLoading());

    var result = await deleteNoteUseCase.call(noteId);

    result.fold(
      (failure) =>
          emit(DeleteNoteFailure(errMessage: failure.errMessage)),
      (success) => emit(DeleteNoteSuccess()),
    );
  }
}
