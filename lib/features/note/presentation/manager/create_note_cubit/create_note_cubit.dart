import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  CreateNoteCubit() : super(CreateNoteInitial());
}
