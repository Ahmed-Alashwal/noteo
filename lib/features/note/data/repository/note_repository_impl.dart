import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
      List<NoteEntity> localNotes = noteLocalDataSource.fetchAllNotes();
      return right(localNotes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
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
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateNote({
    required NoteEntity updatedNoteEntity,
  }) async {
    try {
      await noteLocalDataSource.updateNote(
        updatedNoteEntity: updatedNoteEntity,
      );
      await noteRemoteDataSource.updateNote(
        updatedNoteEntity: updatedNoteEntity,
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote({required String noteId}) async {
    try {
      await noteLocalDataSource.deleteNote(noteId: noteId);
      await noteRemoteDataSource.deleteNote(noteId: noteId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
