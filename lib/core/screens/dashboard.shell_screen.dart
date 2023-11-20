import 'package:go_router/go_router.dart';
import 'package:go_router_test/lib.dart';

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
  Widget buildBottomNavigationBar(BuildContext context) => NavigationBar(
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: (value) {
          // No change
          if (value == widget.selectedIndex) {
            return;
          }

          final newPathName = switch (value) {
            Routes.userListIndex => Routes.userListName,
            Routes.userSettingsIndex => Routes.settingsName,
            _ => throw ('Error'),
          };

          context.goNamed(newPathName);
        },
        destinations: const [
          // (01) User list
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Users',
          ),

          // (02) Settings
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      );
}
