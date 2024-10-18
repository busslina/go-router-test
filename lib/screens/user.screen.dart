import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/screens/screen.dart';
import 'package:go_router_test/utils/named.dart';

class UserScreen extends RearchConsumer with Named, Screen {
  const UserScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  String get named => 'User $userId';

  @override
  Widget buildContent(BuildContext context, WidgetHandle use) {
    final otherUserId = userId == '1' ? '2' : '1';

    return Column(
      children: [
        // Go other user button
        ElevatedButton(
          onPressed: () => context.go('/user/$otherUserId'),
          child: Text('Go to user $otherUserId'),
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
