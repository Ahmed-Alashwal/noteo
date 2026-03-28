import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/utils/functions/service_locator.dart';
import 'package:note_app/features/note/domain/entities/note_entity.dart';
import 'package:note_app/features/splash/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteEntityAdapter());
  await Hive.openBox(AppString.kNoteBox);
  
  runApp(const Noteo());
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
