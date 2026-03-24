import 'package:flutter/material.dart';
import 'package:note_app/splash_screen.dart';

void main() {
  runApp(const Noteo());
}

class Noteo extends StatelessWidget {
  const Noteo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noteo',
      theme: ThemeData(
        fontFamily: "Inria Serif",
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
