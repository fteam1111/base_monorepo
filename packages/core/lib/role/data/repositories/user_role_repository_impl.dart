import 'package:core/core.dart';
import 'package:core/role/data/datasources/remote/role_remote_datasource.dart';
import 'package:core/role/data/mappers/user_role_mapper.dart';
import 'package:core/role/domain/entities/user_role_page_entity.dart';
import 'package:core/role/domain/repositories/user_role_repository.dart';
import 'package:dartz/dartz.dart';

class UserRoleRepositoryImpl implements UserRoleRepository {
  UserRoleRepositoryImpl(this._remoteDataSource);

  final RoleRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, UserRolePageEntity>> getClientRoles({
    int page = 1,
    int size = 10,
  }) async {
    try {
      final response = await _remoteDataSource.getClientRoles(
        page: page,
        size: size,
      );
      final dto = response.data;

      if (dto == null) {
        return const Left(ApiFailure.other('Failed to load roles'));
      }

      return Right(dto.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }
}
