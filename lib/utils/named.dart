mixin Named {
  String get named;

  // ignore: avoid_print
  void dbg(String messgae) => print('($named): $messgae');
}
