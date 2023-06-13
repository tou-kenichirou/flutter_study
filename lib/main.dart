import 'package:flutter/material.dart';
import 'package:flutter_study/stopwatch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String get title => 'Flutter_issue3_ストップウォッチ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: StopwatchApp(title: title,),
    );
  }
}
