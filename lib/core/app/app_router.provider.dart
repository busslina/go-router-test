import 'package:busslina_dart_lightweight_lib/busslina_dart_lightweight_lib.dart'
    as llib;
import 'package:go_router_test/lib.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'app_router.provider.g.dart';

const _initialLocation = Routes.userListPath;

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
    routes: [
      // (01) Login
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => const LoginScreen(),
      ),

      // (02) Dashboard
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          llib.debug(state.asString, active: false);
          return DashboardStatefulShellScreen(
            child: navigationShell,
          );
        },
        branches: [
          // (01) User list
          StatefulShellBranch(
            routes: [
              // (01) Base
              GoRoute(
                  path: Routes.userListPath,
                  name: Routes.userList,
                  builder: (context, state) => const UserListScreen(),
                  routes: [
                    // (01) User modify
                    GoRoute(
                      path: Routes.userModifyPath,
                      name: Routes.userModify,
                      redirect: (context, state) {
                        final userId = state.pathParameters['userId']!;

                        // User removed
                        if (ref
                            .read(usersProvider)
                            .where((id) => id == userId)
                            .isEmpty) {
                          return Routes.userListPath;
                        }

                        return null;
                      },
                      builder: (context, state) => UserModifyScreen(
                        userId: state.pathParameters['userId']!,
                      ),
                    ),
                  ]),
            ],
          ),

          // (02) Settings
          StatefulShellBranch(
            routes: [
              // (01) Base
              GoRoute(
                path: Routes.settings.path,
                name: Routes.settings.name,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
