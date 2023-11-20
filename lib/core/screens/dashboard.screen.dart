import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:go_router_test/lib.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends Screen {
  const DashboardScreen({
    super.key,
  }) : super(
          name: 'Dashboard',
        );

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ScreenState<DashboardScreen> {
  int _counter = 0;

  @override
  Widget buildBody(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Settings link
          buildButton(
              onPressed: () =>
                  context.go(context.namedLocation(Routes.dashboard.settings)),
              child: const fllib.Label('Settings')),

          // User list link
          buildButton(
                  onPressed: () => context
                      .go(context.namedLocation(Routes.dashboard.userList)),
                  child: const fllib.Label('User list'))
              .marginTop(10),

          // Counter text
          fllib.Label('Counter: $_counter').marginTop(20),
        ],
      );

  @override
  Widget? buildFloatingActionButton(BuildContext context) =>
      FloatingActionButton(
        mini: true,
        onPressed: () => setState(() => _counter++),
        child: const Icon(Icons.add),
      );

  @override
  FloatingActionButtonLocation? get floatingActionButtonLocation =>
      FloatingActionButtonLocation.centerFloat;
}
