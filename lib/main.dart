import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/utils/functions/service_locator.dart';
import 'package:note_app/core/utils/functions/simple_bloc_observer.dart';
import 'package:note_app/features/note/data/repository/note_repository_impl.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/note/domain/usecases/fetch_all_notes_use_case.dart';
import 'package:note_app/features/note/presentation/manager/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';
import 'package:note_app/features/splash/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteEntityAdapter());
  await Hive.openBox<NoteEntity>(AppString.kNoteBox);

  runApp(
    BlocProvider(
      create: (context) => FetchAllNotesCubit(
        fetchAllNotesUseCase: FetchAllNotesUseCase(
          noteRepository: di.get<NoteRepositoryImpl>(),
        ),
      )..fetchAllNotes(),
      child: const Noteo(),
    ),
  );
}

class Noteo extends StatelessWidget {
  const Noteo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noteo',
      theme: ThemeData(fontFamily: "Inria Serif"),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
