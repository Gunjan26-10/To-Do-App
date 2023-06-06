import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_to_do_app/components/task_data.dart';

class AddingTaskScreen extends StatefulWidget {
  const AddingTaskScreen({super.key});

  @override
  State<AddingTaskScreen> createState() => _AddingTaskScreenState();
}

class _AddingTaskScreenState extends State<AddingTaskScreen> {
  String newTask = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightBlueAccent,
                ),
              ),
               TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: Colors.lightBlueAccent,
                onChanged: (value){
                  newTask = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false).addTask(newTask);
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
