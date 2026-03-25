import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final DateTime? createdAt;
  @HiveField(4)
  final DateTime? updatedAt;

  const NoteModel({
    this.id,
    required this.title,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });

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
      "created_at": createdAt!.toIso8601String(),
      "updated_at": updatedAt!.toIso8601String(),
    };
  }
}
