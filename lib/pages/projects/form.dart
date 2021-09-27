import 'package:flutter/material.dart';
import 'package:focusplus/models/project.dart';
import 'package:get/get.dart';

class ProjectFormPage extends StatelessWidget {
  final Project project;
  const ProjectFormPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Project'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.delete),
            label: Text('Delete'),
            onPressed: () {
              for (var task in project.tasks!) {
                task.delete();
              }
              project.delete();
              Get.back();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextFormField(
            initialValue: project.name,
            decoration: InputDecoration(labelText: 'New Project'),
            onChanged: (val) {
              project.name = val;
            },
          ),
          Divider(),
          ElevatedButton.icon(
            onPressed: () {
              project.save();
              Get.back();
            },
            icon: Icon(Icons.save),
            label: Text('Save'),
          )
        ],
      ),
    );
  }
}
