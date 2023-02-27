import 'package:application/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String _titleName = "Home page title";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ElinDrawer(),
      appBar: AppBar(
        title: const Text(_titleName),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.add_alert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: Text("Item 123456"),
              ),
              const PopupMenuItem(
                child: Text("Item 2"),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, "/about");
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
