import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/screens/screen.dart';
import 'package:go_router_test/utils/named.dart';
import 'package:rearch/rearch.dart';

class UserScreen extends RearchConsumer with Named, Screen {
  UserScreen({
    super.key,
    required this.userId,
  }) {
    print('UserScreen.constructor() -- User id: $userId');
  }

  final String userId;

  @override
  String get named => 'User $userId';

  @override
  Widget buildContent(BuildContext context, WidgetHandle use) {
    dbg('buld()');

    final otherUserId = userId == '1' ? '2' : '1';

    final counter = use.data(0);

    return Column(
      children: [
        // Go other user button
        ElevatedButton(
          onPressed: () => context.go('/user/$otherUserId'),
          child: Text('Go to user $otherUserId'),
        ),

        // Counter button
        ElevatedButton(
          onPressed: () => counter.value++,
          child: Text('Counter: ${counter.value}'),
        ),

        // Go back button
        ElevatedButton(
          onPressed: context.pop,
          child: const Text('Go back'),
        ),
      ],
    );
  }
}
