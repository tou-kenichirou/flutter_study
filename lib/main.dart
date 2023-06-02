import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final title = 'Flutter_issue1_カウントアップ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CountUpApp(
        title: title,
      ),
    );
  }
}

class CountUpApp extends StatefulWidget {
  const CountUpApp({super.key, required this.title});

  final String title;

  @override
  CountUpState createState() => CountUpState();
}

class CountUpState extends State<CountUpApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 48.0),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _incrementCounter,
              icon: const Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              label: const Text('Count Up!'),
            ),
          ],
        ),
      ),
    );
  }
}
