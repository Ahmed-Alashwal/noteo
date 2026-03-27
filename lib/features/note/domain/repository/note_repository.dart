import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<NoteEntity>>> fetchAllNotes();
  Future<Either<Failure, void>> createNote({required NoteEntity noteEntity});
  Future<Either<Failure, void>> updateNote({
    required NoteEntity updatedNoteEntity,
  });
  Future<Either<Failure, void>> deleteNote({required String noteId});
}
