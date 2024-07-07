import 'package:flutter/material.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Invite Friends'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            leading: const CircleAvatar(),
            title: const Text('Darrel Steward'),
            subtitle: const Text('+234-9079985394'),
            trailing: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text('Invite'),
            ),
          ),
        ));
  }
}
