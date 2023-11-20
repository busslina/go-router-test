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
  Widget build(BuildContext context) => Scaffold(
        body: widget.child,
        bottomNavigationBar: buildBottomNavigationBar(context),
      );

  Widget buildBottomNavigationBar(BuildContext context);
}
