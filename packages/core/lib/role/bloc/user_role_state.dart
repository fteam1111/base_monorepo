import 'package:core/core.dart';
import 'package:core/role/domain/entities/user_role_page_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserRoleState extends Equatable {
  const UserRoleState();

  @override
  List<Object?> get props => [];
}

class UserRoleInitial extends UserRoleState {
  const UserRoleInitial();
}

class UserRoleLoading extends UserRoleState {
  const UserRoleLoading();
}

class UserRoleLoadSuccess extends UserRoleState {
  const UserRoleLoadSuccess(this.page);

  final UserRolePageEntity page;

  @override
  List<Object?> get props => [page];
}

class UserRoleLoadFailure extends UserRoleState {
  const UserRoleLoadFailure(this.failure);

  final ApiFailure failure;

  @override
  List<Object?> get props => [failure];
}

