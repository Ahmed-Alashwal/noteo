part of 'create_note_cubit.dart';

@immutable
sealed class CreateNoteState {}

final class CreateNoteInitial extends CreateNoteState {}
final class CreateNoteLoading extends CreateNoteState {}
final class CreateNoteSuccess extends CreateNoteState {}
final class CreateNoteFailure extends CreateNoteState {
  final String errMessage;

  CreateNoteFailure({required this.errMessage});
}
