import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  final String todo;
  final String description;
  bool? status;
  String? id;

  TodoModel({
    required this.todo,
    required this.description,
    this.status,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todo': todo,
      'description': description,
      'status': status,
      'id': id,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      todo: map['todo'] as String,
      description: map['description'] as String,
      status: map['status'] != null ? map['status'] as bool : null,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
