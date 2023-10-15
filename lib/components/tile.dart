import 'package:crud/services/todo.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoTile extends StatelessWidget {
  late Datum? todo;

  TodoTile({
    super.key,
    this.todo,
  });

  _updateTodo(context) async {
    try {
      Object? val = {
        "id": todo?.id,
        "is_completed": !todo!.isCompleted,
        "title": todo!.title,
        "description": todo?.description,
      };
      final res = await updateTodo(todo!.id, val);
      if (res.statusCode == 200) {
        var status = !todo!.isCompleted ? "Completed" : "Pending";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Marked as $status")),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromRGBO(203, 201, 173, 1),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                value: todo?.isCompleted,
                onChanged: (bool? v) {
                  _updateTodo(context);
                },
                shape: StadiumBorder(),
              ),
              Flexible(
                child: Text(
                  todo?.title ?? "",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 18,
                      color: todo!.isCompleted ? Colors.grey : Colors.black,
                      decoration: todo!.isCompleted
                          ? TextDecoration.lineThrough
                          : null),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
