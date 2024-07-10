import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class RedirectBuilder {
  final Set<Guard> _guards;

  const RedirectBuilder(this._guards);

 Future< String?> call(BuildContext context, GoRouterState state) async{
    for (final guard in _guards) {
      final matched =
          guard.matchPattern.matchAsPrefix(state.matchedLocation) != null;
      if (matched != guard.invertRedirect) {
        return await guard.redirect(context, state);
      }
    }
    return null;
  }
}

abstract base class Guard {
  Pattern get matchPattern;

  bool get invertRedirect => false;

  Future<String?> redirect(BuildContext context, GoRouterState state);
}
