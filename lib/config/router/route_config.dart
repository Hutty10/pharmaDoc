import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show GlobalKey, NavigatorState;
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/features/auth/views/new_password_view.dart';

import '../../core/utils/extensions/string_extension.dart';
import '../../core/widgets/bottom_nav.dart';
import '../../features/auth/views/views.dart';
import '../../features/patient/view/views.dart';
import './route_path.dart';
import './error_page.dart';
import 'auth_guards.dart';
import 'redirect_builder.dart';

final GlobalKey<NavigatorState> _navugatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _navugatorKey,
      initialLocation: RouteName.login.toPath,
      errorBuilder: (context, state) => const ErrorPage(),
      // refreshListenable: ValueNotifier(ref.watch(authNotifierProvider)),
      redirect: RedirectBuilder(
        {
          RedirectIfAuthenticatedGuard(),
          RedirectIfUnauthenticatedGuard(),
        },
      ).call,
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
          routes: [
            GoRoute(
              path: RouteName.addPatient,
              name: RouteName.addPatient,
              builder: (context, state) {
                return const AddPatientScreen();
              },
            ),
            GoRoute(
              path: ':id/${RouteName.addVitals}',
              name: RouteName.addVitals,
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return AddVitalsView(patientId: id);
              },
            ),
            GoRoute(
              path: ':id/${RouteName.referPatient}',
              name: RouteName.referPatient,
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return ReferPatientView(patientId: id);
              },
            ),
            GoRoute(
              path: ':id',
              name: RouteName.patientSummary,
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return PatientSummaryView(patientId: id);
              },
            ),
            GoRoute(
              path: ':id/${RouteName.patientVitals}',
              name: RouteName.patientVitals,
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return PatientVitalsListScreen(patientId: id);
              },
            ),
          ],
        ),
      ],
    );
  },
);
