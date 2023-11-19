import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() => AuthState(loggedIn: false);

  void login() => state = AuthState(loggedIn: true);
}

class AuthState {
  final bool loggedIn;

  AuthState({
    required this.loggedIn,
  });
}
