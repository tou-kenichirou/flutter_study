import 'package:flutter/material.dart';
import 'package:flutter_study/count_up_screen.dart';

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
      home: CountUpApp(title: title)
    );
  }
}
