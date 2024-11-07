import 'package:flutter/material.dart';
import 'first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo, // Фіолетовий колір кнопок
            foregroundColor: Colors.white, // Білий колір тексту
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: FirstScreen(),
    );
  }
}
