import 'package:go_router_test/lib.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  initialLocation: Routes.dashboard.root,
  debugLogDiagnostics: true,
  routes: [
    // (01) Dashboard
    GoRoute(
        path: Routes.dashboard.root,
        name: Routes.dashboard.root,
        builder: (context, state) => const DashboardScreen(),
        routes: [
          // (01) Settings
          GoRoute(
            path: Routes.dashboard.settings,
            name: Routes.dashboard.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ]),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
