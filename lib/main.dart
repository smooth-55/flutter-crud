import 'package:crud/pages/create.dart';
import 'package:crud/pages/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const TodoList(),
        '/create-todo': (context) => const CreateTodoForm(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
