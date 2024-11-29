import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title, String description, String status) {
    _tasks.add(Task(title: title, description: description, status: status));
    notifyListeners();
  }

  void updateTaskStatus(int index, String newStatus) {
    _tasks[index].status = newStatus;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
