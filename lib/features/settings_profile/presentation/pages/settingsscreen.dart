import 'package:flutter/material.dart';
import 'package:health_proj/features/settings_profile/presentation/widgets/biocard.dart';
import 'package:health_proj/features/settings_profile/presentation/widgets/customprogresslisttile.dart';
import 'package:health_proj/features/settings_profile/presentation/widgets/optioncard.dart';

class SettingsprofilePage extends StatelessWidget {
  const SettingsprofilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          OptionCard(
            child: Icons.edit,
          )
        ],
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const BioCard(),
            const Divider(),
            CustomProgressListTile(
              icon: Icons.notifications,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Notifications',
            ),
            CustomProgressListTile(
              icon: Icons.security,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Security',
            ),
            CustomProgressListTile(
              icon: Icons.visibility,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Appearance',
            ),
            CustomProgressListTile(
              icon: Icons.help,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Help',
            ),
            CustomProgressListTile(
              icon: Icons.people_outlined,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Invite Friends',
            ),
            CustomProgressListTile(
              icon: Icons.logout,
              iconColor: Colors.red,
              onTap: () {},
              text: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
