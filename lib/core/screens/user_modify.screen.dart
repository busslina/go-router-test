import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:busslina_dart_lightweight_lib/busslina_dart_lightweight_lib.dart'
    as llib;
import 'package:go_router/go_router.dart';
import 'package:go_router_test/lib.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class UserModifyScreen extends Screen {
  final User user;

  UserModifyScreen({
    super.key,
    required this.user,
  }) : super(
          name: 'User modify: ${user.name}',
        );

  @override
  ConsumerState<UserModifyScreen> createState() => _UserModifyScreenState();
}

class _UserModifyScreenState extends ScreenState<UserModifyScreen> {
  // static const _textColor = Colors.black;
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    // llib.delay(const Duration(seconds: 10)).then((value) => context.pop());
  }

  @override
  Widget buildBody(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Counter
          fllib.Label('Counter: $_counter'),

          // Back button
          buildButton(
                  onPressed: () => context.pop(),
                  child: const fllib.Label('Atras'))
              .marginTop(20)
        ],
      );

  @override
  Widget? buildFloatingActionButton(BuildContext context) =>
      FloatingActionButton(
        mini: true,
        onPressed: () => setState(() => _counter++),
        child: const Icon(Icons.add),
      );

  @override
  FloatingActionButtonLocation? get floatingActionButtonLocation =>
      FloatingActionButtonLocation.centerDocked;
}
