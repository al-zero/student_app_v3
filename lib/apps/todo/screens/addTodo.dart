import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_v3/apps/todo/api/api.dart';
import 'package:student_app_v3/apps/todo/models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoTitleController = TextEditingController();
  final todoDescController = TextEditingController();

  void onAdd() {
    final String textVal = todoTitleController.text;
    final String descVal = todoDescController.text;

    if (textVal.isNotEmpty && descVal.isNotEmpty) {
      final Todo todo = Todo(
        title: textVal,
        description: descVal,
      );
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Add Todo'),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                TextField(
                  controller: todoTitleController,
                ),
                TextField(
                  controller: todoDescController,
                ),
                RaisedButton(
                    child: new Text('Add'),
                    onPressed: () {
                      onAdd();
                      Navigator.of(context).pop();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
