import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:crud/config/api.dart';

class CreateTodoForm extends StatefulWidget {
  const CreateTodoForm({super.key});

  @override
  State<CreateTodoForm> createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends State<CreateTodoForm> {
  final _key_create_form = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void create_todo(BuildContext context) async {
    if (_key_create_form.currentState!.validate()) {
      var title = titleController.text;
      var desc = descriptionController.text;
      try {
        final res = await dio
            .post("/users/todos", data: {"title": title, "description": desc});
        if (res.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data saved')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data saved')),
        );
      }
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Todo"),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _key_create_form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      FormBuilderValidators.required(errorText: "*required"),
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  minLines: 3,
                  maxLines: 3,
                  controller: descriptionController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      create_todo(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text(
                            "Create",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
