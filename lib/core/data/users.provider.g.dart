// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersHash() => r'e60557278c1f8916a15af99043021da5bc8c93cb';

/// See also [Users].
@ProviderFor(Users)
final usersProvider = NotifierProvider<Users, ISet<String>>.internal(
  Users.new,
  name: r'usersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Users = Notifier<ISet<String>>;
String _$userFamHash() => r'ccf7c7ea4e9e1125d55c72cefbd1ead82242ae81';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UserFam extends BuildlessAutoDisposeNotifier<User> {
  late final String id;

  User build(
    String id,
  );
}

/// See also [UserFam].
@ProviderFor(UserFam)
const userFamProvider = UserFamFamily();

/// See also [UserFam].
class UserFamFamily extends Family<User> {
  /// See also [UserFam].
  const UserFamFamily();

  /// See also [UserFam].
  UserFamProvider call(
    String id,
  ) {
    return UserFamProvider(
      id,
    );
  }

  @override
  UserFamProvider getProviderOverride(
    covariant UserFamProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userFamProvider';
}

/// See also [UserFam].
class UserFamProvider extends AutoDisposeNotifierProviderImpl<UserFam, User> {
  /// See also [UserFam].
  UserFamProvider(
    String id,
  ) : this._internal(
          () => UserFam()..id = id,
          from: userFamProvider,
          name: r'userFamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userFamHash,
          dependencies: UserFamFamily._dependencies,
          allTransitiveDependencies: UserFamFamily._allTransitiveDependencies,
          id: id,
        );

  UserFamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  User runNotifierBuild(
    covariant UserFam notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(UserFam Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserFamProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UserFam, User> createElement() {
    return _UserFamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFamProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserFamRef on AutoDisposeNotifierProviderRef<User> {
  /// The parameter `id` of this provider.
  String get id;
}

class _UserFamProviderElement
    extends AutoDisposeNotifierProviderElement<UserFam, User> with UserFamRef {
  _UserFamProviderElement(super.provider);

  @override
  String get id => (origin as UserFamProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
