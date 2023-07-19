import 'package:flutter/material.dart';

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key, required this.title});

  final String title;

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoListApp> {
  final _formKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
  final _addListController = TextEditingController();
  final _editController = TextEditingController();

  final List<String> _todoList = [];

  void _addTodoList() {
    setState(() {
      _todoList.add(_addListController.text);
    });
    _addListController.clear();
  }

  void _removeTodoItem(int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('削除してよろしいですか？'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _todoList.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _editTodoItem(int index) {
    _editController.text = _todoList[index];

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ToDoアイテムの編集'),
          content: Form(
            key: _editFormKey,
            child: TextFormField(
              controller: _editController,
              validator: (value) {
                if (value!.isEmpty) {
                  return '空欄は無効です';
                } else if (_todoList.contains(value)) {
                  return 'すでに同名のタイトルが存在します';
                } else {
                  return null;
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                if (_editFormKey.currentState!.validate()) {
                  setState(() {
                    _todoList[index] = _editController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('保存'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _addListController.dispose();
    _editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _addListController,
                        decoration: const InputDecoration(
                          labelText: 'タイトルの入力',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '空欄は無効です';
                          } else if (_todoList.contains(value)) {
                            return 'すでに同名のタイトルが存在します';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addTodoList();
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    label: const Text('追加'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  final task = _todoList[index];
                  return Card(
                    child: ListTile(
                      title: Text(task),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                            ),
                            onPressed: () => _editTodoItem(index),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_forever,
                            ),
                            onPressed: () => _removeTodoItem(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
