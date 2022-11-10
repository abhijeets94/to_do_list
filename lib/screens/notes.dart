import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/homepage.dart';
import 'package:to_do_list/services/todo_services.dart';

class Notes extends StatefulWidget {
  static const routeName = "/notes";

  Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TodoServices todoServices = TodoServices();

  final id = Get.arguments['id'];
  final todo = Get.arguments['todo'];
  final description = Get.arguments['description'];
  final status = Get.arguments['status'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                todo,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                height: 10,
                color: Colors.red,
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      todoServices.done(
                        context: context,
                        id: id,
                        status: !status,
                      );
                      Get.offAllNamed(HomePage.routeName);
                    },
                    child: Text(
                      status ? " Done " : "Undo",
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Edit")),
                  ElevatedButton(onPressed: () {}, child: const Text("Delete")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
