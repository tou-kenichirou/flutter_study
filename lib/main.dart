import 'package:flutter/material.dart';
import 'package:flutter_study/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String get title => 'Flutter_issue2_ToDoリスト';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TodoListApp(title: title),
    );
  }
}
