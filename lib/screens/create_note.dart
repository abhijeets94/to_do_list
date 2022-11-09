import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_list/services/todo_services.dart';
import 'package:to_do_list/widgets/custom_text_field.dart';

class CreateNote extends StatefulWidget {
  static const routeName = "/create-note";
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final TextEditingController todoController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TodoServices todoServices = TodoServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Add To-Do",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
          child: Column(
            children: [
              CustomTextField(
                controller: todoController,
                hintText: "To-do",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: descriptionController,
                hintText: "Description",
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: dueDateController,
                hintText: "Due Date",
                maxLines: 5,
              ),
              const SizedBox(
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  todoServices.addNotes(
                      todo: todoController.text,
                      description: descriptionController.text,
                      dueDate: dueDateController.text,
                      context: context);
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
