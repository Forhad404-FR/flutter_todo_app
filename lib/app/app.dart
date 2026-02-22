import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../features/todo/screens/todo_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const TodoScreen(),
    );
  }
}