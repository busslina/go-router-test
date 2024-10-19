import 'package:flutter/material.dart';
import 'package:go_router_test/utils/named.dart';

mixin ScreenWidget on StatefulWidget, Named {
  String get title => named;
}

mixin ScreenState<T extends ScreenWidget> on State<T>, Named {
  @override
  String get named => widget.named;

  @override
  void initState() {
    super.initState();
    dbg('initState()');
  }

  @override
  void dispose() {
    dbg('dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
        ),

        // Content
        buildContent(context),
      ],
    );
  }

  Widget buildContent(BuildContext context);
}
