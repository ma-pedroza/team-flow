import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(),
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData(
         colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 5, 26, 54),
      brightness: Brightness.dark,
    ),
    ),);
  }
}
