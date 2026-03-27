import 'package:note_app/features/note/domain/entities/note_entity.dart';

abstract class NoteLocalDataSource {
  List<NoteEntity> fetchAllNotes();
  void createNote({required NoteEntity noteEntity});
  void updateNote({required NoteEntity newNoteEntity});
  void deleteNote({required int noteId});
}

class NoteLocalDataSourceImpl extends NoteLocalDataSource {
  @override
  List<NoteEntity> fetchAllNotes() {}

  @override
  void createNote({required NoteEntity noteEntity}) {}

  @override
  void updateNote({required NoteEntity newNoteEntity}) {}

  @override
  void deleteNote({required int noteId}) {}
}
