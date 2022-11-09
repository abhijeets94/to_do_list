import 'package:flutter/material.dart';
import 'package:to_do_list/constants/error_handling.dart';
import 'package:to_do_list/constants/utils.dart';
import 'package:to_do_list/models/todo_model.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class TodoServices {
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
        dueDate: "",
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
}
