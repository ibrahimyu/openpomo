import 'package:flutter/material.dart';
import 'package:focusplus/main.dart';
import 'package:focusplus/styles.dart';
import 'package:get/get.dart';

class SettingsMainPage extends StatelessWidget {
  const SettingsMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('General', style: Styles.listHeader),
        ),
        GetBuilder<AppCtrl>(
          builder: (ctrl) => ListTile(
            leading: Icon(Icons.dark_mode_sharp),
            title: Text('Dark Mode'),
            trailing: ObxValue(
              (data) => Switch(
                value: ctrl.useDarkTheme.value,
                onChanged: (val) {
                  ctrl.useDarkTheme.value = val;
                  Get.changeThemeMode(
                    ctrl.useDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
              false.obs,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Info Level'),
          trailing: Text('Beginner'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: Text('Select Level'),
                children: [
                  SimpleDialogOption(
                    child: ListTile(
                      leading: Icon(Icons.circle, color: Colors.green),
                      title: Text('Beginner'),
                      subtitle: Text(
                        'Show all tutorial, messages and hints',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop('Beginner');
                    },
                  ),
                  SimpleDialogOption(
                    child: ListTile(
                      leading: Icon(Icons.circle, color: Colors.yellow),
                      title: Text('Intermediate'),
                      subtitle: Text(
                        'Show all only messages and hints',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop('Intermediate');
                    },
                  ),
                  SimpleDialogOption(
                    child: ListTile(
                      leading: Icon(Icons.circle, color: Colors.red),
                      title: Text('Advanced'),
                      subtitle: Text(
                        'Show important messages only. Use this if you want less distraction and used Focus+ for more than 3 months.',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop('Advanced');
                    },
                  ),
                  SimpleDialogOption(
                    child: ListTile(
                      leading: Icon(Icons.circle, color: Colors.black),
                      title: Text('Hardcore'),
                      subtitle: Text(
                        'No hints and texts. Icons only. Full focus with zero distraction.',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop('Hardcore');
                    },
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Pomodoro', style: Styles.listHeader),
        ),
        ListTile(
          title: Text('Preset'),
          trailing: Text('Classic'),
        ),
        ListTile(
          title: Text('Session time'),
          trailing: Text('25 minutes'),
        ),
        ListTile(
          title: Text('Rest time'),
          trailing: Text('5 minutes'),
        ),
        ListTile(
          title: Text('Number of sessions per set'),
          trailing: Text('4'),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Task Mode', style: Styles.listHeader),
        ),
        ListTile(
          title: Text('Focus time daily target'),
          trailing: Text('3 hours'),
        ),
        ListTile(
          title: Text('Planning Phase'),
          trailing: Text('End of the day'),
          // start of day, end of day each session, each set
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Learn Mode', style: Styles.listHeader),
        ),
        ListTile(
          title: Text('Things to learn each day'),
          trailing: Text('5 things'),
        ),
        ListTile(
          title: Text('Topics planning'),
          trailing: Text('Before focus'),
          // before focus, after focus, start of day, end of day
        ),
      ],
    );
  }
}
