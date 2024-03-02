import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/components/task_item.dart';
import 'package:task_list/providers/task_list.dart';
import 'package:task_list/routes/app_routes.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskList _tasks = Provider.of<TaskList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.adicionarTarefa),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: _tasks.itemCount == 0
          ? const Center(
              child: Text("Tarefas"),
            )
          : ListView.builder(
              itemCount: _tasks.itemCount,
              itemBuilder: (ctx, index) {
                return TaskItemWidget(_tasks.tasks[index]);
              }),
    );
  }
}
