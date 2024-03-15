import 'package:flutter/material.dart';
import 'package:task_list/pages/task_list_page.dart';

class PopUpMenuTasks extends StatelessWidget {
  PopUpMenuTasks(
    this._filterTasks, {
    super.key,
  });

  void Function(FilterOptions) _filterTasks;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) => [
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text("Todas"),
        ),
        const PopupMenuItem(
          value: FilterOptions.pending,
          child: Text("Pendentes"),
        ),
        const PopupMenuItem(
          value: FilterOptions.done,
          child: Text("Concluídas"),
        ),
      ],
      icon: const Icon(
        Icons.more_vert,
      ),
      onSelected: (FilterOptions value) => _filterTasks(value),
    );
  }
}
