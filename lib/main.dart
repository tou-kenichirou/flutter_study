import 'package:flutter/material.dart';
import 'package:flutter_study/github_api_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String get title => 'Flutter_issue5_GithubAPI';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GithubAPIApp(title: title,),
    );
  }
}
