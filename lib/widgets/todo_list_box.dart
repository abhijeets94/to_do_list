// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/todo_model.dart';

import 'package:to_do_list/screens/notes.dart';
import 'package:to_do_list/services/todo_services.dart';

class TodoList extends StatefulWidget {
  final TodoModel? todo;
  // final String? description;
  final int? index;

  TodoList({
    Key? key,
    required this.todo,
    // required this.description,
    this.index,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool value = false;
  TodoServices todoServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black)),
      child: Center(
        child: Text(
          widget.todo!.todo.toString(),
          style: TextStyle(
            decoration: todoServices.todo[widget.index!].status
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
