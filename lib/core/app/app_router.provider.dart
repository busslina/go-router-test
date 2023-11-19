import 'package:go_router_test/lib.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'app_router.provider.g.dart';

final _initialLocation = Routes.dashboard.path;

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: _initialLocation,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final loggedIn = ref.read(authProvider).loggedIn;
      final loginRoute = state.fullPath == Routes.login.path;

      return loggedIn
          ? loginRoute
              ? _initialLocation
              : null
          : loginRoute
              ? null
              : Routes.login.path;
    },
    refreshListenable: ref.authListenable,
    routes: [
      // (01) Login
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => const LoginScreen(),
      ),

      // (02) Dashboard
      GoRoute(
        path: Routes.dashboard.path,
        name: Routes.dashboard.name,
        builder: (context, state) => const DashboardScreen(),
        routes: [
          // (01) Settings
          GoRoute(
            path: Routes.dashboard.settings,
            name: Routes.dashboard.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}
