import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetClientFactoriesUseCase {
  GetClientFactoriesUseCase(this._repository);

  final FactoryRepository _repository;

  Future<Either<ApiFailure, List<FactoryEntity>>> call() {
    return _repository.getClientFactories();
  }
}

