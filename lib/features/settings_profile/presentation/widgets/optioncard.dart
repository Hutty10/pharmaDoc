import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.child,
    this.color,
  });
  final IconData child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color != null ? color!.withOpacity(0.3) : Colors.blue[100],
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            child,
            color: color ?? Colors.blue,
          )),
    );
  }
}
