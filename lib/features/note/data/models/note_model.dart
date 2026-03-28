import 'package:note_app/features/note/domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  final String id;
  final String title;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    this.createdAt,
    this.updatedAt,
  }) : super(
         title: title,
         content: content,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  // From API to Flutter
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  factory NoteModel.fromEntity({required NoteEntity noteEntity}) => NoteModel(
    id: noteEntity.id!,
    title: noteEntity.title,
    content: noteEntity.content,
    createdAt: noteEntity.createdAt ?? DateTime.now(),
    updatedAt: noteEntity.updatedAt ?? DateTime.now(),
  );

  // From Flutter to Database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "created_at": createdAt?.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
    };
  }
}
