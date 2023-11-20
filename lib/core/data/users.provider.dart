import 'package:go_router_test/lib.dart';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users.provider.g.dart';

@Riverpod(keepAlive: true)
class Users extends _$Users {
  @override
  ISet<String> build() => ISet(const {
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '10',
        '11',
        '12',
        '13',
        '14',
        '15',
        '16',
        '17',
      });

  void removeAll() => state = state.clear();
}

@riverpod
class UserFam extends _$UserFam {
  @override
  User build(String id) {
    ref.listen(usersProvider, (previous, next) {
      if (!next.contains(id)) {}
    });

    return _users.where((user) => user.id == id).first;
  }
}

final _users = {
  User(id: '1', name: 'Pepe'),
  User(id: '2', name: 'Juan'),
  User(id: '3', name: 'Emilio'),
  User(id: '4', name: 'Susana'),
  User(id: '5', name: 'Alejandro'),
  User(id: '6', name: 'Pedro'),
  User(id: '7', name: 'Luis'),
  User(id: '8', name: 'Roberto'),
  User(id: '9', name: 'Felix'),
  User(id: '10', name: 'Fernando'),
  User(id: '11', name: 'Adrian'),
  User(id: '12', name: 'David'),
  User(id: '13', name: 'Alberto'),
  User(id: '14', name: 'Santiago'),
  User(id: '15', name: 'Javier'),
  User(id: '16', name: 'Maria'),
  User(id: '17', name: 'Valentin'),
};
