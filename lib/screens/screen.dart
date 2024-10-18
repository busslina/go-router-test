import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:go_router_test/utils/named.dart';
import 'package:rearch/rearch.dart';

mixin Screen on RearchConsumer, Named {
  String get title => named;

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    use.effect(
      () {
        dbg('Init');

        return () => dbg('Dispose');
      },
      [],
    );

    return Column(
      children: [
        // Title
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),

        // Content
        buildContent(context, use),
      ],
    );
  }

  Widget buildContent(BuildContext context, WidgetHandle use);
}
