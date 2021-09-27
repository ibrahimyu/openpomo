import 'package:flutter/material.dart';
import 'package:focusplus/models/activity.dart';
import 'package:focusplus/models/difficulty.dart';
import 'package:focusplus/models/project.dart';
import 'package:focusplus/models/task.dart';
import 'package:focusplus/pages/home.dart';
import 'package:focusplus/widgets/countdown_timer.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProjectAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(ActivityAdapter());
  Hive.registerAdapter(DifficultyAdapter());

  await Hive.openBox<Task>('tasks');
  await Hive.openBox<Project>('projects');

  Get.put(AppCtrl());
  Get.put(HomePageCtrl());
  Get.put(CountdownTimerCtrl());
  runApp(const MyApp());
}

class AppCtrl extends GetxController {
  var useDarkTheme = true.obs;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: Get.find<AppCtrl>().useDarkTheme.isTrue
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Focus+',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
