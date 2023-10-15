import 'package:crud/components/tile.dart';
import 'package:crud/config/api.dart';
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

  List<Todo>? todos;

  _getData() async {
    try {
      String url = "/todos";
      final res = await dio.get(url);
      if (res.statusCode == 200) {
        List<dynamic> resp = res.data;
        List<Todo> todoList = resp.map((data) => Todo.fromJson(data)).toList();
        todos = todoList;
        _isLoading = false;
        setState(() {});
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
        // title: Text("Todos", style: TextStyle(color: Color.fromRGBO(189, 219, 208, 1)),),
        title: Text("Todos", style: TextStyle(color: Colors.white),),
        elevation: 0,
        backgroundColor: Color.fromRGBO(81, 75, 35, 1),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: todos?.length,
                  itemBuilder: (context, index) {
                    if (!_isLoading) {
                      return  TodoTile(
                        id: todos?[index].id,
                        title: todos?[index].title,
                        status: todos?[index].completed,
                      );
                    }else{
                      return Container();
                    }

                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-todo');
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
