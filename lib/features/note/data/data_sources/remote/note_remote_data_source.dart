import 'package:note_app/core/api/api_consumer.dart';
import 'package:note_app/core/api/api_endpoints.dart';
import 'package:note_app/features/note/data/models/note_model.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

abstract class NoteRemoteDataSource {
  Future<dynamic> fetchAllNotes();
  Future<dynamic> createNote({required NoteEntity noteEntity});
  Future<dynamic> updateNote({required NoteEntity updatedNoteEntity});
  Future<dynamic> deleteNote({required String noteId});
}

class NoteRemoteDataSourceImpl extends NoteRemoteDataSource {
  final ApiConsumer apiConsumer;

  NoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<dynamic> fetchAllNotes() async {
    return await apiConsumer.get(endPoint: ApiEndpoints.notes());
  }

  @override
  Future<dynamic> createNote({required NoteEntity noteEntity}) async {
    return await apiConsumer.post(
      endPoint: ApiEndpoints.notes(),
      data: NoteModel.fromEntity(noteEntity: noteEntity).toJson(),
    );
  }

  @override
  Future<dynamic> updateNote({required NoteEntity updatedNoteEntity}) async {
    Map<String, dynamic> note = NoteModel.fromEntity(
      noteEntity: updatedNoteEntity,
    ).toJson();
    return await apiConsumer.patch(
      endPoint: ApiEndpoints.notes(noteId: note[ApiKey.id]),
      data: {
        ApiKey.noteTitle: note[ApiKey.noteTitle],
        ApiKey.noteContent: note[ApiKey.noteContent],
      },
    );
  }

  @override
  Future<dynamic> deleteNote({required String noteId}) async {
    return await apiConsumer.delete(
      endPoint: ApiEndpoints.notes(noteId: noteId),
    );
  }
}
