import 'package:crud/config/api.dart';
import 'package:crud/pages/create_todo.dart';
import 'package:crud/pages/list.dart';
import 'package:flutter/material.dart';

void main() {
  configureDio();

  runApp(
    MaterialApp(
      // title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const TodoList(),
        '/create-todo': (context) => const CreateTodoForm(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
    ),
  );
}

