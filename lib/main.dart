import 'package:flutter/material.dart';
import 'package:flutter_study/issue_6/news_api_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String get title => 'Flutter_issue6_NewsAPI';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NewsAPIApp(title: title,),
    );
  }
}
