import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final int? id;
  final String? title;
  final bool? status;
  final String? item;

  TodoTile({
    super.key,
    this.id,
    this.title,
    this.status,
    this.item,
  });

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
              Checkbox(value: status, onChanged: (bool? v) {}, shape: StadiumBorder(),),
              Flexible(
                child: Text(
                  title ?? "",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 16,
                  ),
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
