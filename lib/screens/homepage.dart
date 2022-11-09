import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_list/screens/create_note.dart';
import 'package:to_do_list/widgets/todo_list_box.dart';

import 'notes.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/homePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Container(
        height: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(Notes.routeName, arguments: {
                'index': index,
              }),
              child: Column(
                children: const [
                  TodoList(),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(CreateNote.routeName);
        },
        child: Icon(Icons.add_outlined),
        backgroundColor: Colors.black,
        highlightElevation: 2,
      ),
    );
  }
}
