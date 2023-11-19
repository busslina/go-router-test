import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

abstract class Screen extends ConsumerStatefulWidget {
  final String name;

  const Screen({
    super.key,
    required this.name,
  });
}

abstract class ScreenState<T extends Screen> extends ConsumerState<T> {
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @override
  void initState() {
    fllib.debug('ScreenState.initState() -- ${widget.name}');

    super.initState();
  }

  @override
  void dispose() {
    fllib.debug('ScreenState.dispose() -- ${widget.name}');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: fllib.Label(widget.name),
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
        ),
        body: buildBody(context).expanded().bgColor(Colors.black),
        floatingActionButton: buildFloatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation,
      );

  Widget buildBody(BuildContext context);

  Widget? buildFloatingActionButton(BuildContext context) => null;

  Widget buildButton({
    required VoidCallback? onPressed,
    required Widget child,
  }) =>
      ElevatedButton(onPressed: onPressed, child: child);
}
