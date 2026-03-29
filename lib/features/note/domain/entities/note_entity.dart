import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'note_entity.g.dart';

const uuid = Uuid();

@HiveType(typeId: 0)
class NoteEntity {
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

  NoteEntity({
    required this.id,
    required this.title,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });
}
