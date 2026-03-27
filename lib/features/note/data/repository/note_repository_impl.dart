import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/features/note/data/data_sources/local/note_local_data_source.dart';
import 'package:note_app/features/note/data/data_sources/remote/note_remote_data_source.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/domain/repository/note_repository.dart';

class NoteRepositoryImpl extends NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;
  final NoteRemoteDataSource noteRemoteDataSource;

  NoteRepositoryImpl({
    required this.noteLocalDataSource,
    required this.noteRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<NoteEntity>>> fetchAllNotes() async {
    try {
      var cachedNotes = noteLocalDataSource.fetchAllNotes();
      return right(cachedNotes);
      // var remoteNotes = noteRemoteDataSource.fetchAllNotes();
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, void>> createNote({
    required NoteEntity noteEntity,
  }) async {
    try {
      await noteLocalDataSource.createNote(noteEntity: noteEntity);
      await noteRemoteDataSource.createNote(noteEntity: noteEntity);
      return right(null);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, void>> updateNote({
    required NoteEntity updatedNoteEntity,
  }) async {}

  @override
  Future<Either<Failure, void>> deleteNote({required String noteId}) async {}
}
