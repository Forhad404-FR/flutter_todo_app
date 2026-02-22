import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const taskTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );
  static const taskTime = TextStyle(
    fontSize: 14,
    color:Color.fromARGB(255, 255, 244, 244),
  );

  static const emptyMessage = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 255, 255, 255),
  );
}