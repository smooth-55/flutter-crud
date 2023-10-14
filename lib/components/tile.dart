import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromRGBO(161, 214, 160, 0.8),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(value: true, onChanged: (bool? v) {}),
              Text(
                "Hello there",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 16,
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
