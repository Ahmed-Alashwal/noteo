class NoteEntity {
  final String? id;
  final String title;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const NoteEntity({
    this.id,
    required this.title,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });
}
