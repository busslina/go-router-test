import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/screens/screen.dart';
import 'package:go_router_test/utils/named.dart';

class HomeScreen extends StatefulWidget with Named, ScreenWidget {
  const HomeScreen({super.key});

  @override
  String get named => 'Home';

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with Named, ScreenState<HomeScreen> {
  @override
  Widget buildContent(BuildContext context) {
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
