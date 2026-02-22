import 'package:flutter/material.dart';
import '../features/todo/screens/todo_screen.dart';
import '../features/todo/screens/add_todo_screen.dart';

class AppRoutes {
  static const String todo = '/';
  static const String addTodo = '/addTodo';

  static Map<String, WidgetBuilder> getRoutes({
    required Function(String, DateTime) onAdd,
  }) {
    return {
      todo: (context) => const TodoScreen(),
      addTodo: (context) => AddTodoScreen(onAdd: onAdd),
    };
  }
}
