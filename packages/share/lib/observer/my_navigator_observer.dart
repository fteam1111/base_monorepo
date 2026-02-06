import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNavigatorObserver extends NavigatorObserver {
  String _getName(Route route) {
    final settings = route.settings;

    if (settings is GoRouterState) {
      return settings.name ?? '';
    }

    return settings.name ?? route.runtimeType.toString();
  }

  void _log(String action, Route? route, Route? previousRoute) {
    final name = route != null ? _getName(route) : 'null';
    final prev = previousRoute != null ? _getName(previousRoute) : 'null';

    if (kDebugMode) {
      print('[NAV] $action: $name  (from $prev)');
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _log('PUSH', route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _log('POP', route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _log('REPLACE', newRoute, oldRoute);
  }
}
