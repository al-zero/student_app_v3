import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  TodoProvider() {
    this.fetchTasks();
  }
  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }



// POSTING DATA TO THE API
  void addTodo(Todo todo) async {
    final response = await http.post('localhost:8000/api_todo/v1/',
        headers: {"Content-Type": "application/json"}, body: jsonEncode(todo));
    if (response.statusCode == 201) {
      todo.id = json.decode(response.body)['id'];
      _todos.add(todo);
      notifyListeners();
    }
  }

  // DELETING DATA
  void deleteTodo(Todo todo) async {
    final response =
        await http.delete('http://127.0.0.1:8000/api_todo/v1/${todo.id}/');
    if (response.statusCode == 204) {
      _todos.remove(todo);
      notifyListeners();
    }
  }




  // FETCHING DATA FROM THE API
  fetchTasks() async {
    try {
      final url = 'http://127.0.0.1:8000/api_todo/v1/?format=json';
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
        notifyListeners();
      }
      if (response == null) {
        print('An error occured ');
      }
    } catch (e) {
      print(e);
    }
  }
}
