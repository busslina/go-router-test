import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ShellScreen extends ConsumerStatefulWidget {
  final String debugName;
  late final int selectedIndex;
  final Widget child;

  ShellScreen({
    super.key,
    required this.debugName,
    required String fullPath,
    required this.child,
  }) {
    selectedIndex = getSelectedIndex(fullPath);
  }

  @protected
  int getSelectedIndex(String fullPath);
}

abstract class ShellScreenState<T extends ShellScreen>
    extends ConsumerState<T> {
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @override
  void initState() {
    fllib.debug('ShellScreenState.initState() -- ${widget.debugName}');

    super.initState();
  }

  @override
  void dispose() {
    fllib.debug('ShellScreenState.dispose() -- ${widget.debugName}');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaffoldWithNestedNavigation(
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: getNavigationDestinations(),
        child: widget.child,
      );

  List<NavigationDestinationData> getNavigationDestinations();

  void onDestinationSelected(int index);
}

class NavigationDestinationData {
  final IconData icon;
  final String label;

  NavigationDestinationData({
    required this.icon,
    required this.label,
  });

  NavigationRailDestination get asRailDestination => NavigationRailDestination(
        icon: Icon(icon),
        label: fllib.Label(label),
      );

  NavigationDestination get asDestination => NavigationDestination(
        icon: Icon(icon),
        label: label,
      );
}

class ScaffoldWithBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onDestinationSelected;
  final List<NavigationDestination> destinations;
  final Widget child;

  const ScaffoldWithBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: destinations,
        ),
      );
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onDestinationSelected;
  final List<NavigationRailDestination> destinations;
  final Widget child;

  const ScaffoldWithNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            // Navigator rail
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              destinations: destinations,
            ),

            // Vertical divider
            const VerticalDivider(thickness: 1, width: 1),

            // Child
            Expanded(child: child),
          ],
        ),
      );
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onDestinationSelected;
  final List<NavigationDestinationData> destinations;
  final Widget child;

  const ScaffoldWithNestedNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth < 450

          // [A]: Bottom navigation bar
          ? ScaffoldWithBottomNavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              destinations:
                  destinations.map((item) => item.asDestination).toList(),
              child: child,
            )

          // [B]: Navigation rail
          : ScaffoldWithNavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              destinations:
                  destinations.map((item) => item.asRailDestination).toList(),
              child: child,
            ));
}
