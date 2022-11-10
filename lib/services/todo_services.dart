import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/constants/error_handling.dart';
import 'package:to_do_list/constants/utils.dart';
import 'package:to_do_list/models/todo_model.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class TodoServices extends GetxController {
  TodoModel? todoModel;
  var todo = [].obs;

  void addNotes({
    required String todo,
    required String description,
    String? dueDate,
    required BuildContext context,
  }) async {
    try {
      TodoModel todoModel = TodoModel(
        todo: todo,
        description: description,
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/add-todo'),
        body: todoModel.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint("REsponse = ${response.statusCode}");

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Note added to the list!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getNotes({
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/get-todo"),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );

      if (todo.isNotEmpty) {
        todo.clear();
      }
      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        todo.add(
          TodoModel.fromJson(
            jsonEncode(jsonDecode(res.body)[i]),
          ),
        );

        todo.refresh();
      }
    } catch (e) {
      showSnackBar(context, 'No todo\'s');
    }
  }

  void done({
    required BuildContext context,
    required String id,
    required bool status,
  }) async {
    try {
      http.Response response = await http.put(Uri.parse('$uri/api/done'),
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: jsonEncode({'id': id, 'status': status}));
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          const GetSnackBar(
            title: "Updated",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, "Cannot update");
    }
  }
}
