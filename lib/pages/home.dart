import 'package:flutter/material.dart';
import 'package:focusplus/drawer.dart';
import 'package:focusplus/models/project.dart';
import 'package:focusplus/models/task.dart';
import 'package:focusplus/pages/analytics/main.dart';
import 'package:focusplus/pages/focus/focus.dart';
import 'package:focusplus/pages/settings/main.dart';
import 'package:focusplus/pages/tasks/list.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomePageCtrl {
  var currentPage = Rx<Widget>(const TaskListPage());
}

class HomePage extends GetView<HomePageCtrl> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const Text('Focus+'),
        elevation: 0,
      ),
      body: Obx(() => controller.currentPage.value),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Hive.box<Project>('projects').add(
            Project(
              name: 'New Project',
              tasks: HiveList(
                Hive.box<Task>('tasks'),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.currentPage.value = TaskListPage();
              },
              icon: Icon(Icons.task),
            ),
            IconButton(
              onPressed: () {
                controller.currentPage.value = FocusPage();
              },
              icon: Icon(Icons.timer),
            ),
            SizedBox(
              height: 8,
              width: 44,
            ),
            IconButton(
              onPressed: () {
                controller.currentPage.value = AnalyticsPage();
              },
              icon: Icon(
                Icons.pie_chart,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.currentPage.value = SettingsMainPage();
              },
              icon: Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
