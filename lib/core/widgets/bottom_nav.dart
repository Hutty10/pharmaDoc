import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/features/refer/presentation/pages/referscreen.dart';
import 'package:health_proj/features/settings_profile/presentation/pages/settingsscreen.dart';
import '../utils/extensions/string_extension.dart';

import '../../config/router/route_path.dart';

class BottomNav extends StatefulWidget {
  BottomNav({
    super.key,
    required String tab,
  }) : index = indexFrom(tab);
  final int index;

  @override
  State<BottomNav> createState() => _BottomNavState();
  static int indexFrom(String tab) {
    switch (tab) {
      case 'home':
        return 0;
      case 'patient':
        return 1;
      case 'refers':
        return 2;
      case 'settings':
        return 3;
      default:
        return 0;
    }
  }
}

class _BottomNavState extends State<BottomNav> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          const ReferScreen(),
          const SettingsprofilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.inversePrimary,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            switch (index) {
              case 0:
                context.go(RouteName.home.toPath);
                break;
              case 1:
                context.go(RouteName.patient.toPath);
                break;
              case 2:
                context.go(RouteName.refers.toPath);
                break;
              case 3:
                context.go(RouteName.settings.toPath);
                break;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Patient',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            label: 'Refers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
