import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final DateTime initialTime;
  final Function(DateTime) onTimeSelected;

  const TimePickerWidget({
    super.key,
    required this.initialTime,
    required this.onTimeSelected,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late DateTime _selectedTime;
  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Time: ${_selectedTime.hour}: ${_selectedTime.minute.toString().padLeft(2, '0')}',
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(_selectedTime),
            );
            if (picked != null) {
              setState(() {
                _selectedTime = DateTime(
                  _selectedTime.year,
                  _selectedTime.month,
                  _selectedTime.day,
                  picked.hour,
                  picked.minute,
                );
              });
              widget.onTimeSelected(_selectedTime);
            }
          },
          child: const Text('Pick Time'),
        ),
      ],
    );
  }
}
