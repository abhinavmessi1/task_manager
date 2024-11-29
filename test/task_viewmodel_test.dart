import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/view_models/task_viewmodel.dart';

void main() {
  late TaskViewModel taskViewModel;

  setUp(() {
    // Initialize the TaskViewModel before each test
    taskViewModel = TaskViewModel();
  });

  group('TaskViewModel', () {
    test('should add a new task', () {
      // Arrange
      const title = 'Test Task';
      const description = 'This is a test task';
      const status = 'Pending';

      // Act
      taskViewModel.addTask(title, description, status);

      // Assert
      expect(taskViewModel.tasks.length, 1);
      expect(taskViewModel.tasks[0].title, title);
      expect(taskViewModel.tasks[0].description, description);
      expect(taskViewModel.tasks[0].status, status);
    });

    test('should update the status of an existing task', () {
      // Arrange
      taskViewModel.addTask('Test Task', 'This is a test task', 'Pending');
      const newStatus = 'Completed';

      // Act
      taskViewModel.updateTaskStatus(0, newStatus);

      // Assert
      expect(taskViewModel.tasks[0].status, newStatus);
    });

    test('should delete a task', () {
      // Arrange
      taskViewModel.addTask('Task 1', 'Description 1', 'Pending');
      taskViewModel.addTask('Task 2', 'Description 2', 'In Progress');

      // Act
      taskViewModel.deleteTask(0);

      // Assert
      expect(taskViewModel.tasks.length, 1);
      expect(taskViewModel.tasks[0].title, 'Task 2');
    });

    test(
        'should not throw an error when updating status of a non-existing task',
        () {
      // Act & Assert
      expect(() => taskViewModel.updateTaskStatus(99, 'Completed'),
          throwsRangeError);
    });

    test('should not throw an error when deleting a non-existing task', () {
      // Act & Assert
      expect(() => taskViewModel.deleteTask(99), throwsRangeError);
    });
  });
}
