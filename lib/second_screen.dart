import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String text;
  final double fontSize;

  const SecondScreen({required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center( // Центрування заголовка
          child: Text('Text Previewer'),
        ),
        backgroundColor: Theme.of(context).primaryColor, // Використання кольору індіго
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: fontSize,
              ), // Використання текстової теми з адаптацією розміру шрифту
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'ok');
                  },
                  child: Text('Ok'), // Текстова тема автоматично застосовується
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
