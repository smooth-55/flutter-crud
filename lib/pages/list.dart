import 'package:crud/components/tile.dart';
import 'package:crud/services/todo.dart';
import 'package:crud/models/todo.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  late TodosModel todos;

  _getData() async {
    try {
      final res = await getTodo();
      if (res.statusCode == 200) {
        Map<String, dynamic> resp = res.data;
        var obj = TodosModel.fromJson(resp);
        _isLoading = false;
        setState(() {
          todos = obj;
        });
      }
    } catch (e) {
      _isLoading = false;
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todos",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: todos!.data?.length,
                  itemBuilder: (context, index) {
                    if (!_isLoading) {
                      return TodoTile(
                        todo: todos!.data[index],
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-todo');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
