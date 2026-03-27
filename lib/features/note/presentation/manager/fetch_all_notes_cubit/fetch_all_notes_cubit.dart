import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_all_notes_state.dart';

class FetchAllNotesCubit extends Cubit<FetchAllNotesState> {
  FetchAllNotesCubit() : super(FetchAllNotesInitial());
}
