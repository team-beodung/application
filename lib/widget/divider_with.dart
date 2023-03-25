import 'package:flutter/material.dart';

class DividerWith extends StatelessWidget {
  final Widget child;
  final Divider divider;

  const DividerWith({
    super.key,
    required this.child,
    required this.divider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: divider),
        Expanded(child: child),
        Expanded(child: divider),
      ],
    );
  }
}
