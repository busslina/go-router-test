import 'package:go_router_test/core/app/app_router.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() => AuthState(loggedIn: false);

  void login() {
    // Bad usage
    if (state.loggedIn) {
      throw ('Auth.login() -- Bad usage');
    }

    state = AuthState(loggedIn: true);

    ref.read(appRouterProvider).refresh();
  }

  void logout() {
    // Bad usage
    if (!state.loggedIn) {
      throw ('Auth.logout() -- Bad usage');
    }

    state = AuthState(loggedIn: false);

    ref.read(appRouterProvider).refresh();
  }
}

class AuthState {
  final bool loggedIn;

  AuthState({
    required this.loggedIn,
  });
}
