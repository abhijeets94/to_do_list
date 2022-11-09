import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/notes.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Checkbox(
              value: this.value,
              onChanged: (bool? value) {
                setState(
                  () {
                    this.value = value!;
                  },
                );
              },
            ),
          ),
          const Text("THIS IS NOTE "),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.delete_outline_outlined),
          ),
        ],
      ),
    );
  }
}
