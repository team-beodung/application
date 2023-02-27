import 'package:flutter/material.dart';

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({super.key});

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alarm"),
      ),
      body: const Center(
        child: Text("Alarm Page"),
      ),
    );
  }
}
