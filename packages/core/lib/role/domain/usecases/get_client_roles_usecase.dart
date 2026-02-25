import 'package:core/core.dart';
import 'package:core/role/domain/entities/user_role_page_entity.dart';
import 'package:core/role/domain/repositories/user_role_repository.dart';
import 'package:dartz/dartz.dart';

class GetClientRolesUseCase {
  GetClientRolesUseCase(this._repository);

  final UserRoleRepository _repository;

  Future<Either<ApiFailure, UserRolePageEntity>> call({
    int page = 1,
    int size = 10,
  }) {
    return _repository.getClientRoles(page: page, size: size);
  }
}

