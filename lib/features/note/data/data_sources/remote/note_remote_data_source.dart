import 'package:note_app/core/utils/functions/api_service.dart';
import 'package:note_app/features/note/data/models/note_model.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

abstract class NoteRemoteDataSource {
  Future<List<NoteEntity>> fetchAllNotes();
  Future<void> createNote({required NoteEntity noteEntity});
  Future<void> updateNote({required NoteEntity newNoteEntity});
  Future<void> deleteNote({required String noteId});
}

class NoteRemoteDataSourceImpl extends NoteRemoteDataSource {
  final ApiService apiService;

  NoteRemoteDataSourceImpl({required this.apiService});

  List<NoteEntity> getNoteList(Map<String, dynamic> data) {
    List<NoteEntity> notes = [];
    for (var note in data as List) {
      notes.add(NoteModel.fromJson(note));
    }
    return notes;
  }

  @override
  Future<List<NoteEntity>> fetchAllNotes() async {
    var data = await apiService.get(endPoint: "notes");
    List<NoteEntity> notes = getNoteList(data);
    return notes;
  }

  @override
  Future<void> createNote({required NoteEntity noteEntity}) async {
    final noteModel = NoteModel(
      id: noteEntity.id,
      title: noteEntity.title,
      content: noteEntity.content,
      createdAt: noteEntity.createdAt ?? DateTime.now(),
      updatedAt: noteEntity.updatedAt ?? DateTime.now(),
    );
    await apiService.post(endPoint: "notes", body: noteModel.toJson());
  }

  @override
  Future<void> updateNote({required NoteEntity newNoteEntity}) async {}

  @override
  Future<void> deleteNote({required String noteId}) async {
    await apiService.delete(endPoint: "notes", id: noteId);
  }
}
