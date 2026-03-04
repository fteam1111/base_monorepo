import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class UserRoleRepositoryImpl implements UserRoleRepository {
  UserRoleRepositoryImpl(this._remoteDataSource);

  final RoleRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, List<UserRoleEntity>>> getClientRoles({
    int? page,
    int? size,
  }) async {
    try {
      final response = await _remoteDataSource.getClientRoles(
        page: page,
        size: size,
      );

      final pagination = response.data;
      final items = pagination?.data;

      if (items == null) {
        return const Left(ApiFailure.other('Failed to load roles'));
      }

      final entities = items.map((e) => e.toEntity()).toList();

      return Right(entities);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }
}
