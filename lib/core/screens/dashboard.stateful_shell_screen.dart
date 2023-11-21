// import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
//     as fllib;
import 'package:go_router_test/lib.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DashboardStatefulShellScreen extends StatefulShellScreen {
  const DashboardStatefulShellScreen({
    super.key,
    required super.child,
  }) : super(
          debugName: 'Dashboard',
        );

  @override
  ConsumerState<DashboardStatefulShellScreen> createState() =>
      _DashboardShellScreenState();
}

class _DashboardShellScreenState
    extends StatefulShellScreenState<DashboardStatefulShellScreen> {
  @override
  List<NavigationDestinationData> getNavigationDestinations() => [
        // (01) User list
        NavigationDestinationData(
          icon: Icons.people,
          label: 'Users',
        ),

        // (02) Settings
        NavigationDestinationData(
          icon: Icons.settings,
          label: 'Settings',
        ),
      ];
}
