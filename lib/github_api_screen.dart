import 'package:flutter/material.dart';
import 'package:flutter_study/github_api_result_screen.dart';

class GithubAPIApp extends StatefulWidget {
  const GithubAPIApp({super.key, required this.title});

  final String title;

  @override
  SearchGithubScreenState createState() => SearchGithubScreenState();
}

class SearchGithubScreenState extends State<GithubAPIApp> {
  final TextEditingController _textEditingController = TextEditingController();
  final _searchedList = <String>[];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: TextField(
          controller: _textEditingController,
          decoration: const InputDecoration(
            label: Text(
              'GitHubリポジトリ名を入力(Enterで検索)',
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          onSubmitted: (String text) {
            _searchedList.add(text);
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => GithubAPIAppResult(
                  query: text.trim(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
