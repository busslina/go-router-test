import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
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
  // static const _textColor = Colors.black;
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    // ref.listenManual(usersProvider, (previous, next) {
    //   if (!next.contains(widget.userId!)) {
    //     setState(() => _selectedUserId = null);
    //   }
    // });

    // llib.delay(const Duration(seconds: 10)).then((value) => context.pop());
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
