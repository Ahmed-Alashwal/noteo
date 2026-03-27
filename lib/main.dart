import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/features/note/data/models/note_model.dart';
import 'package:note_app/features/splash/presentation/screens/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
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
