part of 'fetch_all_notes_cubit.dart';

abstract class FetchAllNotesState {}

final class FetchAllNotesInitial extends FetchAllNotesState {}

final class FetchAllNotesLoading extends FetchAllNotesState {}

final class FetchAllNotesSuccess extends FetchAllNotesState {
  final List<NoteEntity> notes;

  FetchAllNotesSuccess({required this.notes});
}

final class FetchAllNotesFailure extends FetchAllNotesState {
  final String errMessage;

  FetchAllNotesFailure({required this.errMessage});
}
