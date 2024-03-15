import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/providers/task_list.dart';

class TaskFormPage extends StatelessWidget {
  const TaskFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController descricao = TextEditingController();

    final _tasks = Provider.of<TaskList>(context);
    void _addTask() {
      if (descricao.text.isNotEmpty) {
        _tasks.addTask(descricao.text);
        Navigator.of(context).pop();
      }
    }

    return SizedBox(
      height: 200,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: Column(
          children: [
            const Text(
              "Descrição",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: descricao,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => _addTask(),
                    child: const Text("Salvar"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancelar"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
