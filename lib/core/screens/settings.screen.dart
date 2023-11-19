// import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
//     as fllib;
import 'package:go_router_test/lib.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends Screen {
  const SettingsScreen({
    super.key,
  }) : super(
          name: 'Settings',
        );

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ScreenState<SettingsScreen> {
  @override
  Widget buildBody(BuildContext context) => Container();
}
