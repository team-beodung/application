import 'package:flutter/material.dart';

class ElinDrawer extends StatefulWidget {
  final bool isLogin;

  const ElinDrawer({super.key, this.isLogin = false});

  @override
  State<ElinDrawer> createState() => _ElinDrawer();
}

class _ElinDrawer extends State<ElinDrawer> {
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
