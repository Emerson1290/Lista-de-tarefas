import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/components/pop_up_menu_tasks.dart';
import 'package:task_list/components/task_item.dart';
import 'package:task_list/models/task.dart';
import 'package:task_list/pages/task_form_page.dart';
import 'package:task_list/providers/task_list.dart';
import 'package:task_list/routes/app_routes.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  FilterOptions selectecOption = FilterOptions.all;

  @override
  Widget build(BuildContext context) {
    TaskList taskProvider = Provider.of<TaskList>(context);

    late List<Task> tasks;

    if (selectecOption == FilterOptions.all) {
      tasks = taskProvider.tasks;
    } else if (selectecOption == FilterOptions.done) {
      tasks = taskProvider.completedTasks;
    } else {
      tasks = taskProvider.pendingTasks;
    }

    void _filterTasks(FilterOptions value) {
      setState(() {
        selectecOption = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        actions: [
          IconButton(
            onPressed: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const Dialog(
                    child: TaskFormPage(),
                  );
                }),
            icon: const Icon(Icons.add),
          ),
          PopUpMenuTasks(_filterTasks),
        ],
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text("Tarefas"),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, index) {
                return TaskItemWidget(tasks[index]);
              }),
    );
  }
}

enum FilterOptions {
  all,
  done,
  pending,
}
