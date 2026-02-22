import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/custom_button.dart';
import '../widgets/time_picker_widget.dart';

class AddTodoScreen extends StatefulWidget {
  final Function(String, DateTime) onAdd;

  const AddTodoScreen({super.key, required this.onAdd});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _controller = TextEditingController();
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Tadk'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TimePickerWidget(
              initialTime: _selectedTime,
              onTimeSelected:(time){
                setState(() {
                  _selectedTime = time;
                });
              },
              ),
            const SizedBox(height: 40),
            CustomButton(
              text:AppStrings.saveTask, 
              onPressed:(){
                if(_controller.text.isNotEmpty){
                  widget.onAdd(_controller.text, _selectedTime);
                  Navigator.pop(context);
                }
              }),
          ],
        ),
      ),
    );
  }
}
