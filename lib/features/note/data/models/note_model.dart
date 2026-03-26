import 'package:hive/hive.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends NoteEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final DateTime? createdAt;
  @HiveField(4)
  final DateTime? updatedAt;

  const NoteModel({
    required this.id,
    required this.title,
    required this.content,
    this.createdAt,
    this.updatedAt,
  }) : super(
         id: id,
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
