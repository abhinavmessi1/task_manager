import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import '../views/add_task_form.dart';
import '../views/task_item_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Centers the title in the AppBar
        backgroundColor: Colors.purple, // Sets the AppBar color to purple
      ),
      body: Column(
        children: [
          Expanded(
            child: taskViewModel.tasks.isEmpty
                ? const Center(child: Text('No tasks available.'))
                : ListView.builder(
                    itemCount: taskViewModel.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskViewModel.tasks[index];
                      return TaskItemWidget(task: task, index: index);
                    },
                  ),
          ),
          ElevatedButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (_) => const AddTaskForm(),
            ),
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
