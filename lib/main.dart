import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/task_viewmodel.dart';
import 'views/dashboard_screen.dart';

void main() {
  runApp(const TaskDashboardApp());
}

class TaskDashboardApp extends StatelessWidget {
  const TaskDashboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Dashboard',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const DashboardScreen(),
      ),
    );
  }
}
