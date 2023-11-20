import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:go_router_test/lib.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class UserListScreen extends Screen {
  const UserListScreen({
    super.key,
  }) : super(
          name: 'User List',
        );

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ScreenState<UserListScreen> {
  static const _textColor = Colors.black;

  User? _selectedUser;

  @override
  Widget buildBody(BuildContext context) => Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User list
          _buildUserList(),

          // User detail
          if (_selectedUser != null) _buildUserDetail(_selectedUser!),
        ],
      );

  Widget _buildUserList() => Expanded(
        flex: 2,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: users.map((user) => _buildUserCard(user)).toList(),
          ),
        ),
      );

  Widget _buildUserCard(User user) => Column(
        children: [
          // Id
          fllib.Label(
            'Id: ${user.id}',
            fontSize: 14,
            color: _textColor,
          ),

          // Name
          fllib.Label(
            user.name,
            fontSize: 17,
            color: _textColor,
          ),
        ],
      )
          .bgColor(Colors.lime)
          .onTap(() => setState(() => _selectedUser = user))
          .withSizeConstraints(const BoxConstraints(minWidth: 200))
          .rounded()
          .withMargin(const EdgeInsets.symmetric(horizontal: 10, vertical: 10));

  Widget _buildUserDetail(User user) => Expanded(
        flex: 5,
        child: Column(
          children: [
            // Id
            fllib.Label(
              'Id: ${user.id}',
              fontSize: 17,
              color: _textColor,
            ).marginTop(10),

            // Name
            fllib.Label(
              user.name,
              fontSize: 20,
              color: _textColor,
            ).marginTop(5),
          ],
        )
            .bgColor(
              Colors.lime,
            )
            .rounded()
            .withMargin(
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
      );
}

class User {
  final String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  @override
  String toString() => '($id): $name';
}

final users = {
  User(id: '1', name: 'Pepe'),
  User(id: '2', name: 'Juan'),
  User(id: '3', name: 'Emilio'),
  User(id: '4', name: 'Susana'),
  User(id: '5', name: 'Alejandro'),
  // User(id: '6', name: 'Pedro'),
  // User(id: '7', name: 'Luis'),
  // User(id: '8', name: 'Roberto'),
  // User(id: '9', name: 'Felix'),
  // User(id: '10', name: 'Fernando'),
  // User(id: '11', name: 'Adrian'),
  // User(id: '12', name: 'David'),
  // User(id: '13', name: 'Alberto'),
  // User(id: '14', name: 'Santiago'),
  // User(id: '15', name: 'Javier'),
  // User(id: '16', name: 'Maria'),
  // User(id: '17', name: 'Valentin'),
};
