import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:go_router_test/lib.dart';

import 'package:flutter/material.dart';

class SettingsScreen extends Screen {
  const SettingsScreen({
    super.key,
  }) : super(
          name: 'Settings',
        );

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ScreenState<SettingsScreen> {
  @override
  Widget buildBody(BuildContext context) =>
      const fllib.Label('Settings').centered();
}
