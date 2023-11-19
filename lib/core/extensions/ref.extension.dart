import 'package:go_router_test/lib.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefExtension on Ref {
  Listenable get authListenable {
    late final ValueNotifier listenable;
    return listenable = ValueNotifier(
        listen(authProvider, (_, next) => listenable.value = next).read());
  }
}
