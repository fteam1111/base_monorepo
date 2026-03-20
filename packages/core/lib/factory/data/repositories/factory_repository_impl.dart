import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class FactoryRepositoryImpl implements FactoryRepository {
  FactoryRepositoryImpl(this._remoteDataSource);

  final FactoryRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, List<FactoryEntity>>> getClientFactories() async {
    try {
      final response =
          await _remoteDataSource.getClientFactories();

      final items = response.data;

      if (items == null) {
        return const Left(ApiFailure.other('Failed to load factories'));
      }

      final entities = items.map((e) => e.toEntity()).toList();

      return Right(entities);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }
}

