import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:busslina_dart_lightweight_lib/busslina_dart_lightweight_lib.dart'
    as llib;
import 'package:go_router/go_router.dart';
import 'package:go_router_test/lib.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class UserModifyScreen extends Screen {
  final String userId;

  const UserModifyScreen({
    super.key,
    required this.userId,
  }) : super(
          name: 'User modify',
        );

  @override
  ConsumerState<UserModifyScreen> createState() => _UserModifyScreenState();
}

class _UserModifyScreenState extends ScreenState<UserModifyScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    ref.listenManual(usersProvider, (previous, next) {
      // User removed -- Refreshing app router
      if (!next.contains(widget.userId)) {
        ref.read(appRouterProvider).refresh();
      }
    });

    // Test delay
    llib
        .delay(const Duration(seconds: 5))
        .then((value) => ref.read(usersProvider.notifier).removeAll());
  }

  User get _userRead => ref.read(userFamProvider(widget.userId));

  @override
  String get scaffoldTitle => 'User modify: ${_userRead.name}';

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
      FloatingActionButtonLocation.centerFloat;
}
