import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_list/screens/create_note.dart';
import 'package:to_do_list/services/todo_services.dart';
import 'package:to_do_list/widgets/todo_list_box.dart';

import 'notes.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/homePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoServices todoServices = Get.put(TodoServices());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoServices.getNotes(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "To-Do List",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        return Container(
          height: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: todoServices.todo.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.offAllNamed(Notes.routeName, arguments: {
                  'id': todoServices.todo[index].id,
                  'todo': todoServices.todo[index].todo,
                  'description': todoServices.todo[index].description,
                  'status': todoServices.todo[index].status,
                }),
                child: Column(
                  children: [
                    TodoList(
                      index: index,
                      todo: todoServices.todo[index],
                      // description: todoServices.todo[index].description,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(CreateNote.routeName);
          },
          child: Icon(Icons.add_outlined),
          backgroundColor: Colors.black,
          highlightElevation: 2,
        ),
      ),
    );
  }
}
