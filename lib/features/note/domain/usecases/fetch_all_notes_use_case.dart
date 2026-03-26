import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/core/usecase/use_case.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/domain/repository/note_repository.dart';

class FetchAllNotesUseCase extends UseCase<List<NoteEntity>, NoParam> {
  final NoteRepository noteRepository;

  FetchAllNotesUseCase({required this.noteRepository});

  @override
  Future<Either<Failure, List<NoteEntity>>> call([NoParam? param]) {
    return noteRepository.fetchAllNotes();
  }
}
