import 'package:flutter/material.dart';
import 'package:focusplus/pages/analytics/main.dart';
import 'package:focusplus/pages/focus/focus.dart';
import 'package:focusplus/pages/home.dart';
import 'package:focusplus/pages/misc/about.dart';
import 'package:focusplus/pages/settings/main.dart';
import 'package:focusplus/pages/tasks/list.dart';
import 'package:focusplus/pages/timeline/list.dart';
import 'package:get/get.dart';

class HomeDrawer extends GetView<HomePageCtrl> {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        controller: ScrollController(),
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(140, 0, 0, 0),
                    radius: 48,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/drawer_header.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.center_focus_strong),
            title: const Text('Focus'),
            onTap: () {
              Get.back();
              controller.currentPage.value =
                  Builder(builder: (context) => const FocusPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Tasks'),
            onTap: () {
              Get.back();
              controller.currentPage.value =
                  Builder(builder: (context) => const TaskListPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.timeline),
            title: const Text('Timeline'),
            onTap: () {
              Get.back();
              controller.currentPage.value =
                  Builder(builder: (context) => const TimelinePage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Analytics'),
            onTap: () {
              Get.back();
              controller.currentPage.value =
                  Builder(builder: (context) => const AnalyticsPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.back();
              controller.currentPage.value =
                  Builder(builder: (context) => const SettingsMainPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Get.back();
              controller.currentPage.value =
                  Builder(builder: (context) => const AboutPage());
            },
          ),
        ],
      ),
    );
  }
}
