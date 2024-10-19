import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/screens/screen.dart';
import 'package:go_router_test/utils/named.dart';

class UserScreen extends StatefulWidget with Named, ScreenWidget {
  const UserScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  String get named => 'User $userId';

  @override
  State<StatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with Named, ScreenState<UserScreen> {
  int _counter = 0;

  @override
  Widget buildContent(BuildContext context) {
    final otherUserId = widget.userId == '1' ? '2' : '1';

    return Column(
      children: [
        // Go other user button
        ElevatedButton(
          onPressed: () => context.go('/user/$otherUserId'),
          child: Text('Go to user $otherUserId'),
        ),

        // Counter button
        ElevatedButton(
          onPressed: () {
            setState(() => _counter++);
          },
          child: Text('Counter: $_counter'),
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
