import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:go_router_test/lib.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LoginScreen extends Screen {
  const LoginScreen({
    super.key,
  }) : super(
          name: 'Login',
        );

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ScreenState<LoginScreen> {
  @override
  Widget buildBody(BuildContext context) => buildButton(
          onPressed: () => ref.read(authProvider.notifier).login(),
          child: const fllib.Label('Log In'))
      .centered();
}
