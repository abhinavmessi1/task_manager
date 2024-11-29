import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../viewmodels/task_viewmodel.dart';
import './widgets/confirmation_dialog.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final int index;

  const TaskItemWidget({Key? key, required this.task, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context, listen: false);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<String>(
              value: task.status,
              items: ['Pending', 'In Progress', 'Completed']
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      ))
                  .toList(),
              onChanged: (value) {
                taskViewModel.updateTaskStatus(index, value!);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                final confirm = await showDialog(
                  context: context,
                  builder: (_) => const ConfirmationDialog(),
                );
                if (confirm == true) {
                  taskViewModel.deleteTask(index);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
