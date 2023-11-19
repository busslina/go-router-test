import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as llib;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class Screen extends StatefulWidget {
  final String name;

  const Screen({
    super.key,
    required this.name,
  });
}

abstract class ScreenState<T extends Screen> extends State<T> {
  @override
  void initState() {
    llib.debug('ScreenState.initState() -- ${widget.name}');

    super.initState();
  }

  @override
  void dispose() {
    llib.debug('ScreenState.dispose() -- ${widget.name}');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
        ),
        body: buildBody(context).expanded().bgColor(Colors.black),
      );

  Widget buildBody(BuildContext context);

  Widget buildButton({
    required VoidCallback? onPressed,
    required Widget child,
  }) =>
      ElevatedButton(onPressed: onPressed, child: child);
}
