import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetClientRolesUseCase {
  GetClientRolesUseCase(this._repository);

  final UserRoleRepository _repository;

  Future<Either<ApiFailure, List<UserRoleEntity>>> call({
    int? page,
    int? size,
  }) {
    return _repository.getClientRoles(page: page, size: size);
  }
}
