import 'package:flutter/material.dart';
import 'package:health_proj/features/settings_profile/presentation/pages/settingsscreen.dart';
import 'package:health_proj/features/settings_profile/presentation/widgets/optioncard.dart';

class CustomProgressListTile extends StatelessWidget {
  const CustomProgressListTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    required this.text,
  });
  final IconData icon;
  final Color iconColor;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      leading: OptionCard(
        child: icon,
        color: iconColor,
      ),
      title: Text(text),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.blue,
        size: 15,
      ),
    );
  }
}
