import 'package:core/core.dart';
import 'package:core/model/base_response.dart';
import 'package:core/factory/data/datasources/remote/factory_remote_datasource.dart';
import 'package:core/factory/data/mappers/factory_mapper.dart';
import 'package:core/factory/data/models/factory_model_dto.dart';
import 'package:core/factory/domain/entities/factory_entity.dart';
import 'package:core/factory/domain/repositories/factory_repository.dart';
import 'package:dartz/dartz.dart';

class FactoryRepositoryImpl implements FactoryRepository {
  FactoryRepositoryImpl(this._remoteDataSource);

  final FactoryRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, List<FactoryEntity>>> getClientFactories() async {
    try {
      final BaseResponse<List<FactoryModelDto>> response =
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

