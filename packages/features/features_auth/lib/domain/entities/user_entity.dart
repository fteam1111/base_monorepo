import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

/// Domain layer user entity
/// Pure business logic, no dependencies on external frameworks
class UserEntity extends Equatable {
  final IntegerValue id;
  final EmailVinAddress email;
  final StringValue fullName;
  final bool isActive;
  final UserRoleEntity role;
  final FactoryEntity? factory;

  const UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.isActive,
    required this.role,
    this.factory,
  });

  @override
  List<Object?> get props => [id, fullName, email, isActive, role, factory];

  @override
  String toString() =>
      'UserEntity(id: $id, fullName: $fullName, email: $email, isActive: $isActive, role: $role, factory: $factory)';
}
