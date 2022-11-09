import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  final String todo;
  final String description;
  final String dueDate;
  TodoModel({
    required this.todo,
    required this.description,
    required this.dueDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todo': todo,
      'description': description,
      'dueDate': dueDate,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      todo: map['todo'] as String,
      description: map['description'] as String,
      dueDate: map['dueDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
