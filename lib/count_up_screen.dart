import 'package:flutter/material.dart';

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
      if (_counter < 100) {
        _counter++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('100が限界です'),
          ),
        );
      }
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
            const SizedBox(height: 28),
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
