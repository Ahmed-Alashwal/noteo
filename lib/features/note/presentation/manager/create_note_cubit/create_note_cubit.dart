import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/domain/usecases/create_note_use_case.dart';

part 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  CreateNoteCubit({required this.createNoteUseCase})
    : super(CreateNoteInitial());

  final CreateNoteUseCase createNoteUseCase;

  Future<void> createNote({required NoteEntity noteEntity}) async {
    emit(CreateNoteLoading());

    var result = await createNoteUseCase.call(noteEntity);
    result.fold(
      (failure) => emit(
        CreateNoteFailure(errMessage: "Error while create a note!"),
      ),
      (success) => emit(CreateNoteSuccess()),
    );
  }
}
