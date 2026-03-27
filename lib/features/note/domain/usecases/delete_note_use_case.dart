import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/core/usecase/use_case.dart';
import 'package:note_app/features/note/domain/repository/note_repository.dart';

class DeleteNoteUseCase extends UseCase<void, String> {
  final NoteRepository noteRepository;

  DeleteNoteUseCase({required this.noteRepository});

  @override
  Future<Either<Failure, void>> call([String? id]) {
    return noteRepository.deleteNote(noteId: id!);
  }
}
