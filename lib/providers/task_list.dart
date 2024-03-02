import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_list/models/task.dart';

class TaskList extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => [..._tasks];

  int get itemCount => tasks.length;

  void addTask(String descricao) {
    _tasks.add(Task(
      id: Random().nextDouble().toString(),
      descricao: descricao,
    ));
    notifyListeners();
  }

  void removeTask(String id) {
    int index = _tasks.indexWhere((i) => i.id == id);
    if (index >= 0) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }
}
