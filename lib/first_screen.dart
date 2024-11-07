import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 16.0;

  Future<void> _showDialog(String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/robot.png', height: 50),
              SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Align(
              alignment: Alignment.bottomRight, // Вирівнювання кнопки справа
              child: TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _navigateToSecondScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(
          text: _textController.text,
          fontSize: _fontSize,
        ),
      ),
    );

    if (result == 'ok') {
      _showDialog('Cool!');
    } else if (result == 'cancel') {
      _showDialog('Let’s try something else');
    } else {
      _showDialog('Don\'t know what to say');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Text Previewer'),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Text',
                  hintText: 'Enter some text',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                  ),
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  hintStyle: TextStyle(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              // Зменшено відстань між TextField і Slider
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Font size: ${_fontSize.toStringAsFixed(1)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Expanded(
                    child: Slider(
                      value: _fontSize,
                      min: 12.0,
                      max: 100.0,
                      divisions: 20,
                      label: _fontSize.toString(),
                      onChanged: (value) {
                        setState(() {
                          _fontSize = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _navigateToSecondScreen,
                child: Text('Preview'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}