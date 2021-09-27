import 'package:flutter/material.dart';
import 'package:focusplus/models/project.dart';
import 'package:focusplus/models/task.dart';
import 'package:hive/hive.dart';

class AddTaskBox extends StatefulWidget {
  final Project project;

  const AddTaskBox({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<AddTaskBox> createState() => _AddTaskBoxState();
}

class _AddTaskBoxState extends State<AddTaskBox> {
  final TextEditingController taskTitleController = TextEditingController();
  bool addingTask = false;

  @override
  Widget build(BuildContext context) {
    return addingTask
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Focus(
              autofocus: true,
              child: TextFormField(
                controller: taskTitleController,
                decoration: InputDecoration(
                  icon: IconButton(
                      onPressed: () {
                        setState(() => addingTask = false);
                      },
                      icon: Icon(Icons.cancel)),
                  hintText: 'New Task',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      if (taskTitleController.text.isEmpty) {
                        return;
                      }

                      var task = Task(title: taskTitleController.text);
                      //task.save();
                      Hive.box<Task>('tasks').add(task);
                      widget.project.tasks!.add(task);
                      widget.project.save();

                      taskTitleController.text = '';

                      setState(() {
                        addingTask = false;
                      });
                    },
                  ),
                ),
              ),
            ),
          )
        : ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Add Task'),
            onTap: () {
              setState(() {
                addingTask = true;
              });
            },
          );
  }
}
