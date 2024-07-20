import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/views/views.dart';
import '../../features/patient/view/views.dart';
import '../../features/refer/presentation/pages/referscreen.dart';
import '../../features/settings_profile/presentation/pages/settingsscreen.dart';
import '../providers.dart';
import '../utils/extensions/string_extension.dart';

import '../../config/router/route_path.dart';

class BottomNav extends ConsumerStatefulWidget {
  BottomNav({
    super.key,
    required String tab,
  }) : index = indexFrom(tab);
  final int index;

  @override
  ConsumerState<BottomNav> createState() => _BottomNavState();
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

class _BottomNavState extends ConsumerState<BottomNav> {
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
    final role = ref.watch(userTypeProvider).value?.toLowerCase() ?? '';
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomeView(),
          const PatientView(),
          if (role == 'pharm') const ReferScreen(),
          const SettingsprofilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: theme.colorScheme.surface,
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
                if (role == 'pharm') {
                  context.go(RouteName.refers.toPath);
                } else {
                  context.go(RouteName.settings.toPath);
                }
                break;
              case 3:
                context.go(RouteName.settings.toPath);
                break;
            }
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Patient',
          ),
          if (role == 'pharm')
            const BottomNavigationBarItem(
              icon: Icon(Icons.sync),
              label: 'Refers',
            ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
