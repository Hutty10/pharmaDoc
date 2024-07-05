import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './core/utils/app_provider_observer.dart';
import './config/router/route_config.dart';
import './config/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      observers: [
        AppProviderObserver(),
      ],
      child: HealthApp(),
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
