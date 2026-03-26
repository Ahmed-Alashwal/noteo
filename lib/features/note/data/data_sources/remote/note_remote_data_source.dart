import 'package:note_app/features/note/domain/entities/note_entity.dart';

abstract class NoteRemoteDataSource {
  Future<List<NoteEntity>> fetchAllNotes();
  Future<void> createNote({required NoteEntity noteEntity});
  Future<void> updateNote({required NoteEntity newNoteEntity});
  Future<void> deleteNote({required String id});
}

class NoteRemoteDataSourceImpl extends NoteRemoteDataSource {
  @override
  Future<void> createNote({required NoteEntity noteEntity}) {
    // TODO: implement createNote
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNote({required String id}) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteEntity>> fetchAllNotes() {
    // TODO: implement fetchAllNotes
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote({required NoteEntity newNoteEntity}) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
