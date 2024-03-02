import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/providers/task_list.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController descricao = TextEditingController();

    TaskList _tasks = Provider.of<TaskList>(context);
    void _addTask() {
      if (descricao.text.isNotEmpty) {
        _tasks.addTask(descricao.text);
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Column(
          children: [
            const Text(
              "Descrição",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: descricao,
            )
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => _addTask(),
      ),
    );
  }
}
