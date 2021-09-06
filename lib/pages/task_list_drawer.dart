import 'package:flutter/material.dart';

class TaskListDrawer extends StatelessWidget {
  const TaskListDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(title: Text('In Progress')),
          ...List.generate(
              5,
              (index) => ListTile(
                    leading: Checkbox(
                      value: false,
                      onChanged: (val) {
                        //
                      },
                    ),
                    title: Text('Ongoing Task $index'),
                  )),
          const ListTile(title: Text('Completed')),
          ...List.generate(
              5,
              (index) => ListTile(
                    leading: const Icon(Icons.check_circle),
                    title: Text('Completed Task $index'),
                  )),
        ],
      ),
    );
  }
}
