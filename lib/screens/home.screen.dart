import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/screens/screen.dart';
import 'package:go_router_test/utils/named.dart';

class HomeScreen extends RearchConsumer with Named, Screen {
  const HomeScreen({super.key});

  @override
  String get named => 'Home';

  @override
  Widget buildContent(BuildContext context, WidgetHandle use) {
    return Column(
      children: [
        // User 1 button
        ElevatedButton(
          onPressed: () => context.go('/user/1'),
          child: const Text('User 1'),
        ),

        // User 2 button
        ElevatedButton(
          onPressed: () => context.go('/user/2'),
          child: const Text('User 2'),
        ),
      ],
    );
  }
}
