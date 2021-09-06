import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text('Export Data'),
            onTap: () {
              //
            },
          ),
        ],
      ),
    );
  }
}
