import 'package:flutter/material.dart';
import '../controller/todo_controller.dart';
import '../widgets/todo_item.dart';
import 'add_todo_screen.dart';
import '../../../core/constants/app_strings.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoController _controller = TodoController();

  void _addTask(String title, DateTime time) {
    setState(() {
      _controller.addTodo(title, time);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _controller.deleteTodo(index);
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _controller.toggleTodo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = _controller.todos;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        centerTitle: true,
      ),
      body: todos.isEmpty
          ? const Center(
              child: Text(
                AppStrings.noTasks,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return TodoItem(
                  todo: todo,
                  onDelete: () => _deleteTask(index),
                  onToggle: () => _toggleTask(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open Add Task Screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodoScreen(onAdd: _addTask),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}