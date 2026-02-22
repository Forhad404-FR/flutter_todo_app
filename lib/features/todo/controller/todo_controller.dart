import '../../../data/models/todo_model.dart';
import '../../../data/repositories/todo_repository.dart';

class TodoController{
  final TodoRepository _repository = TodoRepository();

  List<TodoModel> get todos => _repository.getTodos();

  // add task
  void addTodo(String title, DateTime time){
    final todo = TodoModel(title: title, time: time);
    _repository.addTodo(todo);
  }

  //delete task
  void deleteTodo(int index){
    _repository.deleteTodo(index);
  }

  //mark task done/undone
  void toggleTodo(int index){
    _repository.toggleTodo(index);
  }
}