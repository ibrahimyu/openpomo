import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:focusplus/models/project.dart';
import 'package:focusplus/pages/projects/form.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'add_task_box.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  Widget getProjectSlivers(Project project) {
    return Column(
      children: [
        ListTile(
          title: Text(
            project.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onLongPress: () {
            Get.to(() => ProjectFormPage(project: project));
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var task = project.tasks![index];
            return ListTile(
              leading: Checkbox(
                value: task.done,
                onChanged: (val) {
                  task.done = val ?? false;
                  project.save();
                },
              ),
              title: Text(task.title),
              onLongPress: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                            onTap: () {
                              Get.back();
                              task.delete();
                              project.save();
                            },
                          ),
                        ],
                      );
                    });
              },
            );
          },
          itemCount: project.tasks?.length ?? 0,
        ),
        AddTaskBox(project: project),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Project>>(
      valueListenable: Hive.box<Project>('projects').listenable(),
      builder: (context, box, child) {
        var projects = box.values.toList();
        return ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: box.values.length,
          itemBuilder: (context, index) => getProjectSlivers(projects[index]),
        );
      },
    );
  }
}
