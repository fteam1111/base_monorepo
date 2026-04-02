import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

enum UserRoleStatus { initial, loading, success, failure }

final class UserRoleState extends Equatable {
  const UserRoleState({
    this.status = UserRoleStatus.initial,
    this.roles = const <UserRoleEntity>[],
    this.failure,
  });

  final UserRoleStatus status;
  final List<UserRoleEntity> roles;
  final ApiFailure? failure;

  UserRoleState copyWith({
    UserRoleStatus? status,
    List<UserRoleEntity>? roles,
    ApiFailure? failure,
    bool clearFailure = false,
  }) {
    return UserRoleState(
      status: status ?? this.status,
      roles: roles ?? this.roles,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [status, roles, failure];
}
