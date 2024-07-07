import 'package:flutter/material.dart';

class PatientReferInfoText extends StatelessWidget {
  const PatientReferInfoText({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Text(info),
      ),
    ]);
  }
}
