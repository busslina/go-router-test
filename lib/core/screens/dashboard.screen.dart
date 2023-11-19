import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:go_router_test/lib.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends Screen {
  const DashboardScreen({
    super.key,
  }) : super(
          name: 'Dashboard',
        );

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ScreenState<DashboardScreen> {
  @override
  Widget buildBody(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          const fllib.Label('Dashboard'),

          // Settings link
          buildButton(
              onPressed: () => context
                  .go('${Routes.dashboard.root}/${Routes.dashboard.settings}'),
              child: const fllib.Label('Settings')),
        ],
      );
}
