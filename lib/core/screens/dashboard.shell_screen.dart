// import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
//     as fllib;
import 'package:go_router_test/lib.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DashboardShellScreen extends ShellScreen {
  DashboardShellScreen({
    super.key,
    required super.fullPath,
    required super.child,
  }) : super(
          debugName: 'Dashboard',
        );

  @override
  ConsumerState<DashboardShellScreen> createState() =>
      _DashboardShellScreenState();

  @override
  int getSelectedIndex(String fullPath) => switch (fullPath) {
        Routes.userListPath => 0,
        Routes.settingsPath => 1,
        _ => throw ('Error'),
      };
}

class _DashboardShellScreenState
    extends ShellScreenState<DashboardShellScreen> {
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

  @override
  void onDestinationSelected(int index) {
    // No change
    if (index == widget.selectedIndex) {
      return;
    }

    final newPathName = switch (index) {
      Routes.userListIndex => Routes.userListName,
      Routes.userSettingsIndex => Routes.settingsName,
      _ => throw ('Error'),
    };

    context.goNamed(newPathName);
  }
}
