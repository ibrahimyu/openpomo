import 'package:flutter/material.dart';
import 'task_list_drawer.dart';
import 'timer.dart';
import 'settings_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OpenPomo'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.task_alt_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      drawer: const TaskListDrawer(),
      body: const TimerWidget(),
      endDrawer: const SettingsDrawer(),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.menu),
        );
      }),
    );
  }
}
