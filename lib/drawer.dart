import 'package:flutter/material.dart';

class ElinDrawer extends StatelessWidget {
  const ElinDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text("Drawer Header"),
          ),
          ListTile(
            title: const Text("Alarm"),
            onTap: () {
              Navigator.pushNamed(context, "/alarm");
            },
          ),
          ListTile(
            title: const Text("Item 2"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
