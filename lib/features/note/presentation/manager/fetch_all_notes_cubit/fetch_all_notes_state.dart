part of 'fetch_all_notes_cubit.dart';

@immutable
sealed class FetchAllNotesState {}

final class FetchAllNotesInitial extends FetchAllNotesState {}
final class FetchAllNotesLoading extends FetchAllNotesState {}
final class FetchAllNotesSuccess extends FetchAllNotesState {}
final class FetchAllNotesFailure extends FetchAllNotesState {
  final String errMessage;

  FetchAllNotesFailure({required this.errMessage});
}
