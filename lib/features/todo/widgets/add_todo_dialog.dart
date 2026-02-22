import 'package:flutter/material.dart';
import 'time_picker_widget.dart';
import '../../../core/constants/app_strings.dart';

class AddTodoDialog extends StatefulWidget {
  final Function(String, DateTime) onAdd;

  const AddTodoDialog({super.key, required this.onAdd});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController _controller = TextEditingController();
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.addTask),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Task',
            ),
          ),
          const SizedBox(height: 16),
          TimePickerWidget(
            initialTime: _selectedTime,
            onTimeSelected: (time) => _selectedTime = time,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              widget.onAdd(_controller.text, _selectedTime);
              Navigator.pop(context);
            }
          },
          child: const Text(AppStrings.saveTask),
        ),
      ],
    );
  }
}