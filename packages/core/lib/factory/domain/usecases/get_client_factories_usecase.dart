import 'package:core/core.dart';
import 'package:core/factory/domain/entities/factory_entity.dart';
import 'package:core/factory/domain/repositories/factory_repository.dart';
import 'package:dartz/dartz.dart';

class GetClientFactoriesUseCase {
  GetClientFactoriesUseCase(this._repository);

  final FactoryRepository _repository;

  Future<Either<ApiFailure, List<FactoryEntity>>> call() {
    return _repository.getClientFactories();
  }
}

