import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/models/task.dart';
import 'package:task_list/providers/task_list.dart';

class TaskItemWidget extends StatefulWidget {
  const TaskItemWidget(
    this._task, {
    super.key,
  });

  final Task _task;

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  void _toggleFavorite() => setState(() => widget._task.completeTask());

  @override
  Widget build(BuildContext context) {
    final _taskListProvider = Provider.of<TaskList>(context);

    Future<bool> _removeTask(BuildContext context) {
      return showDialog<bool>(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text("Atenção!"),
              content: const Text("Deseja remover a tarefa?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("Sim"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Não"),
                ),
              ],
            );
          }).then<bool>((value) {
        if (value!) {
          _taskListProvider.removeTask(widget._task.id);
        }
        return value;
      });
    }

    return Dismissible(
      key: Key(widget._task.id),
      confirmDismiss: (_) => _removeTask(context),
      background: Container(
        padding: const EdgeInsets.only(right: 10),
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(color: Colors.red),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Container(
        decoration: BoxDecoration(
          color: widget._task.isCompleted ? Colors.black12 : Colors.white,
        ),
        child: ListTile(
          title: Text(
            widget._task.descricao,
            style: TextStyle(
              fontStyle: widget._task.isCompleted
                  ? FontStyle.italic
                  : FontStyle.normal,
            ),
          ),
          trailing: IconButton(
            icon: Icon(widget._task.isCompleted
                ? Icons.task_alt
                : Icons.circle_outlined),
            onPressed: () => _toggleFavorite(),
          ),
        ),
      ),
    );
  }
}
