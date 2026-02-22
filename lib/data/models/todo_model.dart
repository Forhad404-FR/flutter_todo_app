class TodoModel {
  final String title;
  final DateTime time;
  bool isCompleted;

  TodoModel({
    required this.title,
    required this.time,
    this.isCompleted= false,
  });
}
