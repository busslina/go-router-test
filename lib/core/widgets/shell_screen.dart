import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract class ShellScreen extends ConsumerStatefulWidget {
  final String debugName;
  final StatefulNavigationShell child;

  const ShellScreen({
    super.key,
    required this.debugName,
    required this.child,
  });
}

abstract class ShellScreenState<T extends ShellScreen>
    extends ConsumerState<T> {
  static const _debugging = false;

  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @override
  void initState() {
    fllib.debug(
      'ShellScreenState.initState() -- ${widget.debugName}',
      active: _debugging,
    );

    super.initState();
  }

  @override
  void dispose() {
    fllib.debug(
      'ShellScreenState.dispose() -- ${widget.debugName}',
      active: _debugging,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _ScaffoldWithNestedNavigation(
        navigationShell: widget.child,
        destinations: getNavigationDestinations(),
        child: widget.child,
      );

  List<NavigationDestinationData> getNavigationDestinations();
}

class NavigationDestinationData {
  final IconData icon;
  final String label;

  NavigationDestinationData({
    required this.icon,
    required this.label,
  });

  NavigationDestination get asDestination => NavigationDestination(
        icon: Icon(icon),
        label: label,
      );

  NavigationRailDestination get asRailDestination => NavigationRailDestination(
        icon: Icon(icon),
        label: fllib.Label(
          label,
          color: Colors.black,
        ),
        disabled: false,
      );
}

class _ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  // final int selectedIndex;
  // final Function(int index) onDestinationSelected;
  final List<NavigationDestinationData> destinations;
  final Widget child;

  const _ScaffoldWithNestedNavigation({
    required this.navigationShell,
    // required this.selectedIndex,
    // required this.onDestinationSelected,
    required this.destinations,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth < 450

          // [A]: Bottom navigation bar
          ? _ScaffoldWithBottomNavigationBar(
              // selectedIndex: selectedIndex,
              selectedIndex: navigationShell.currentIndex,
              // onDestinationSelected: onDestinationSelected,
              onDestinationSelected: navigationShell.goBranch,
              destinations:
                  destinations.map((item) => item.asDestination).toList(),
              child: child,
            )

          // [B]: Navigation rail
          : _ScaffoldWithNavigationRail(
              // selectedIndex: selectedIndex,
              selectedIndex: navigationShell.currentIndex,
              // onDestinationSelected: onDestinationSelected,
              onDestinationSelected: navigationShell.goBranch,
              destinations:
                  destinations.map((item) => item.asRailDestination).toList(),
              child: child,
            ));

  // void _goToBranch(int index) {
  //   navigationShell.goBranch
  // }
}

class _ScaffoldWithBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onDestinationSelected;
  final List<NavigationDestination> destinations;
  final Widget child;

  const _ScaffoldWithBottomNavigationBar({
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

class _ScaffoldWithNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onDestinationSelected;
  final List<NavigationRailDestination> destinations;
  final Widget child;

  const _ScaffoldWithNavigationRail({
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
              labelType: NavigationRailLabelType.selected,
            ),

            // Vertical divider
            const VerticalDivider(thickness: 1, width: 1),

            // Child
            Expanded(child: child),
          ],
        ),
      );
}
