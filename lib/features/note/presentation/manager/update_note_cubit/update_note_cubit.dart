import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/domain/usecases/update_note_use_case.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit({required this.updateNoteUseCase})
    : super(UpdateNoteInitial());

  final UpdateNoteUseCase updateNoteUseCase;

  Future<void> updateNote({required NoteEntity updatedNoteEntity}) async {
    emit(UpdateNoteLoading());

    var result = await updateNoteUseCase.call(updatedNoteEntity);
    result.fold(
      (failure) => emit(UpdateNoteFailure(errMessage: failure.errMessage)),
      (success) => emit(UpdateNoteSuccess()),
    );
  }
}
