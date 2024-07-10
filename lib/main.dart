import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_proj/features/auth/controllers/provider/providers.dart';

import './core/utils/app_provider_observer.dart';
import './config/router/route_config.dart';
import './config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const secureStorage = FlutterSecureStorage();
  final token = await secureStorage.read(key: 'auth_token');
  runApp(
    ProviderScope(
      overrides: [
        authStateProvider.overrideWith((ref) => token),
      ],
      observers: const [
        AppProviderObserver(),
      ],
      child: const HealthApp(),
    ),
  );
}

class HealthApp extends ConsumerWidget {
  const HealthApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: ref.watch(goRouterProvider),
        debugShowCheckedModeBanner: false,
        title: 'Health App',
        theme: AppTheme.theme(),
        themeMode: ThemeMode.dark,
        color: const Color(0xff4CAF50),
      ),
    );
  }
}
