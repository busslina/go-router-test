import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:go_router_test/router.dart';

class App extends RearchConsumer {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    // return

    final router = use(routerCapsule);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
