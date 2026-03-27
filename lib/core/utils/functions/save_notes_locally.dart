import 'package:hive/hive.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

void saveNotesLocally({
  required List<NoteEntity> notes,
  required dynamic notesBox,
}) {
  var box = Hive.box(notesBox);
  box.add(notes);
}
