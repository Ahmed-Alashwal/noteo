import 'package:hive/hive.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

abstract class NoteLocalDataSource {
  List<NoteEntity> fetchAllNotes();
  Future<void> createNote({required NoteEntity noteEntity});
  Future<void> updateNote({required NoteEntity updatedNoteEntity});
  Future<void> deleteNote({required int noteId});
}

class NoteLocalDataSourceImpl extends NoteLocalDataSource {
  @override
  List<NoteEntity> fetchAllNotes() {
    var box = Hive.box<NoteEntity>(AppString.kNoteBox);
    return box.values.toList();
  }

  @override
  Future<void> createNote({required NoteEntity noteEntity}) async {
    var box = Hive.box<NoteEntity>(AppString.kNoteBox);
    await box.put(noteEntity.id, noteEntity);
  }

  @override
  Future<void> updateNote({required NoteEntity updatedNoteEntity}) async {
    var box = Hive.box<NoteEntity>(AppString.kNoteBox);
    await box.put(updatedNoteEntity.id, updatedNoteEntity);
  }

  @override
  Future<void> deleteNote({required int noteId}) async {
    var box = Hive.box<NoteEntity>(AppString.kNoteBox);
    await box.delete(noteId);
  }
}
