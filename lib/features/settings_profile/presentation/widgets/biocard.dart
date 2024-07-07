import 'package:flutter/material.dart';

class BioCard extends StatelessWidget {
  const BioCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 18.0,
          ),
          child: CircleAvatar(
            radius: 35,
            child: Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adam Smith',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'adam.smith@yourdomain.com',
            ),
            Text(
              'Indonesia',
            )
          ],
        ))
      ],
    );
  }
}
