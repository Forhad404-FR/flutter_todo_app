import '../models/todo_model.dart';

class TodoRepository {
  final List<TodoModel> _todos = [];
  // get all tasks
  List<TodoModel> getTodos(){
    return _todos;
  }

  // add new task
  void addTodo(TodoModel todo){
    _todos.add(todo);
  }
  
  //Delete task
  void deleteTodo(int index){
    _todos.removeAt(index);
  }

  // Toggle completed status
  void toggleTodo(int index){
    _todos[index].isCompleted = !_todos[index].isCompleted;
  }
}