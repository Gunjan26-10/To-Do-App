import 'package:flutter/material.dart';
import 'package:my_to_do_app/components/task_tile.dart';
import 'package:my_to_do_app/components/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.task[index];
            return TaskTile(
                taskTitle: taskData.task[index].name,
                isChecked: taskData.task[index].isDone,
                checkboxCallback: (bool? checkboxState) {
                  setState(() {
                    taskData.task[index].toggleDone();
                  });
                },
                longPressCallback: () {
                  taskData.deleteTask(task);
            },
                );
          },
          itemCount: taskData.lengthCount);
    });
  }
}
