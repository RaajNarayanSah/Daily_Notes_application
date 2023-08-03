import 'package:do_anything/models/task.dart';
import 'package:flutter/foundation.dart';
import '';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    // Task(name: 'Buy Milk'),
    // Task(name: 'Buy Toast'),
    // Task(name: 'Buy Biscuit'),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
