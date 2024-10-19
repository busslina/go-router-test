import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/screens/home.screen.dart';
import 'package:go_router_test/screens/user.screen.dart';
import 'package:rearch/rearch.dart';

GoRouter routerCapsule(CapsuleHandle use) {
  return GoRouter(
    routes: <RouteBase>[
      // Home
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          key: ValueKey('Home'),
          child: HomeScreen(),
        ),
        routes: <RouteBase>[
          // User
          GoRoute(
            path: '/user/:userId',
            pageBuilder: (context, state) {
              final userId = state.pathParameters['userId']!;

              print('Building MaterialPage for User id: $userId');

              return MaterialPage(
                // key: ValueKey('User $userId'),
                child: UserScreen(
                  userId: userId,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
