import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
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

  String? _selectedUserId;

  @override
  void initState() {
    super.initState();

    ref.listenManual(usersProvider, (previous, next) {
      // Selected user removed -- Updating local state
      if (_selectedUserId != null && !next.contains(_selectedUserId!)) {
        setState(() => _selectedUserId = null);
      }
    });
  }

  @override
  Widget buildBody(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User list
          _buildUserList(),

          // User detail
          if (_selectedUserId != null) _buildUserDetail(_selectedUserId!),
        ],
      );

  Widget _buildUserList() => Expanded(
        flex: 2,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: ref
                .watch(usersProvider)
                .map((userId) => _buildUserCard(userId))
                .toList(),
          ),
        ),
      );

  Widget _buildUserCard(String userId) {
    final user = ref.watch(userFamProvider(userId));

    return Column(
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
        .onTap(() => setState(() => _selectedUserId = user.id))
        .withSizeConstraints(const BoxConstraints(minWidth: 200))
        .rounded()
        .withMargin(const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  }

  Widget _buildUserDetail(String userId) {
    final user = ref.watch(userFamProvider(userId));

    return Expanded(
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

          // Modify button
          buildButton(
              onPressed: () => context.goNamed(Routes.userModify,
                  pathParameters: {'userId': user.id}),
              child: const fllib.Label('Modify')),
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
}

class User with EquatableMixin {
  final String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  @override
  String toString() => '($id): $name';
}
