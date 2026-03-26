import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/core/usecase/use_case.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/domain/repository/note_repository.dart';

class CreateNoteUseCase extends UseCase<void, NoteEntity> {
  final NoteRepository noteRepository;

  CreateNoteUseCase({required this.noteRepository});

  @override
  Future<Either<Failure, void>> call([NoteEntity? noteEntity]) {
    return noteRepository.createNote(noteEntity: noteEntity!);
  }
}
