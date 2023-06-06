import 'package:flutter/foundation.dart';
import 'package:my_to_do_app/components/task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {

  final List<Task> _tasks = [
    Task(name: 'Go to the gym'),
    Task(name: 'Eat protein'),
    Task(name: 'Go to sleep'),
  ];

  UnmodifiableListView<Task> get task  {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String title) {
    final task = Task(name: title);
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  int get lengthCount {
    return _tasks.length;
  }
}