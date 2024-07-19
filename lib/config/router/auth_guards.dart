import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/controllers/provider/providers.dart';
import 'redirect_builder.dart';

final class RedirectIfAuthenticatedGuard extends Guard {
  // matches login and signup routes
  @override
  Pattern get matchPattern => RegExp(r'^/(login|register)$');

  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final container = ProviderScope.containerOf(context, listen: false);
    // var token = await container.read(authRepositoryProvider).getToken();
    var token = null;
    if (token != null) {
      return '/home';
    }
    return null;
  }
}

final class RedirectIfUnauthenticatedGuard extends Guard {
  // matches dashboard and settings routes
  @override
  Pattern get matchPattern => RegExp(r'^/(login|register)$');

  @override
  bool get invertRedirect => true;

  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final container = ProviderScope.containerOf(context, listen: false);
    final token = await container.read(authRepositoryProvider).getToken();

    if (token == null) {
      return '/login';
    }

    return null;
  }
}
