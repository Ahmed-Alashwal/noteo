part of 'delete_note_cubit.dart';

@immutable
sealed class DeleteNoteState {}

final class DeleteNoteInitial extends DeleteNoteState {}

final class DeleteNoteLoading extends DeleteNoteState {}

final class DeleteNoteSuccess extends DeleteNoteState {}

final class DeleteNoteFailure extends DeleteNoteState {
  final String errMessage;

  DeleteNoteFailure({required this.errMessage});
}
