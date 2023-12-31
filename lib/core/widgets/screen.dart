import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_test/core/auth/auth.provider.dart';

abstract class Screen extends ConsumerStatefulWidget {
  final String name;

  const Screen({
    super.key,
    required this.name,
  });
}

abstract class ScreenState<T extends Screen> extends ConsumerState<T> {
  static const _debugging = false;

  @override
  void initState() {
    fllib.debug(
      'ScreenState.initState() -- ${widget.name}',
      active: _debugging,
    );

    super.initState();
  }

  @override
  void dispose() {
    fllib.debug(
      'ScreenState.dispose() -- ${widget.name}',
      active: _debugging,
    );

    super.dispose();
  }

  String get scaffoldTitle => widget.name;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: fllib.Label(
            scaffoldTitle,
            color: Colors.white,
            fontSize: 20,
          ),
          actions: [
            if (ref.watch(authProvider).loggedIn)
              IconButton(
                  onPressed: () => ref.read(authProvider.notifier).logout(),
                  icon: const Icon(Icons.logout))
          ],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 61, 57, 57),
          foregroundColor: Colors.white,
        ),
        body: buildBody(context).boxExpanded().bgColor(Colors.black),
        floatingActionButton: buildFloatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation,
      );

  Widget buildBody(BuildContext context);

  Widget? buildFloatingActionButton(BuildContext context) => null;

  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  Widget buildButton({
    required VoidCallback? onPressed,
    required Widget child,
  }) =>
      ElevatedButton(onPressed: onPressed, child: child);
}
