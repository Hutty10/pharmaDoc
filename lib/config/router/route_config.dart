import 'package:flutter/material.dart' show GlobalKey, NavigatorState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/features/auth/views/new_password_view.dart';

import '../../core/utils/extensions/string_extension.dart';
import '../../core/widgets/bottom_nav.dart';
import '../../features/auth/views/views.dart';
import './route_path.dart';

final GlobalKey<NavigatorState> _navugatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _navugatorKey,
      initialLocation: RouteName.login.toPath,
      routes: [
        // GoRoute(
        //   path: RouteName.onboarding.toPath,
        //   name: RouteName.onboarding,
        //   builder: (context, state) => const LoginView(),
        // ),
        GoRoute(
          path: RouteName.login.toPath,
          name: RouteName.login,
          builder: (context, state) {
            return const LoginView();
          },
        ),
        GoRoute(
          path: RouteName.register.toPath,
          name: RouteName.register,
          builder: (context, state) {
            return const RegisterView();
          },
        ),
        GoRoute(
          path: RouteName.forgetPassword.toPath,
          name: RouteName.forgetPassword,
          builder: (context, state) {
            return const ForgetPasswordView();
          },
        ),
        GoRoute(
          path: RouteName.verifyCode.toPath,
          name: RouteName.verifyCode,
          builder: (context, state) {
            final email = state.uri.queryParameters['email']!;
            return VerificationCodeView(email: email);
          },
        ),
        GoRoute(
          path: RouteName.newPassword.toPath,
          name: RouteName.newPassword,
          builder: (context, state) {
            return const NewPasswordView();
          },
        ),
        GoRoute(
          path: '/:tab(home|patient|refers|settings)',
          builder: (context, state) {
            final tab = state.pathParameters['tab']!;
            return BottomNav(tab: tab);
          },
        ),
      ],
    );
  },
);
