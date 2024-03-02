import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  String id;
  String descricao;
  bool isCompleted;

  Task({
    required this.id,
    required this.descricao,
    this.isCompleted = false,
  });

  void completeTask() {
    isCompleted = !isCompleted;
    notifyListeners();
  }
}
