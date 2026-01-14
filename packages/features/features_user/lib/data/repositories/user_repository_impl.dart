import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_user/features_user.dart';

/// Implementation of UserRepository
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, UserEntity>> getUserById(String id) async {
    try {
      final userModel = await _remoteDataSource.getUserById(id);

      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, UserEntity>> updateUser({
    required String id,
    String? name,
    String? email,
    String? avatar,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (name != null) data['name'] = name;
      if (email != null) data['email'] = email;
      if (avatar != null) data['avatar'] = avatar;

      final userModel = await _remoteDataSource.updateUser(id, data);

      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, void>> deleteUser(String id) async {
    try {
      await _remoteDataSource.deleteUser(id);

      return const Right(null);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, List<UserEntity>>> getUsers({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final userModels = await _remoteDataSource.getUsers({
        'page': page,
        'limit': limit,
      });

      final entities = userModels.map((model) => model.toEntity()).toList();

      return Right(entities);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }
}
