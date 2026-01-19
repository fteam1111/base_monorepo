import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_home/domain/entities/network_test_entity.dart';
import 'package:features_home/domain/repositories/network_test_repository.dart';

/// Implementation of NetworkTestRepository
class NetworkTestRepositoryImpl implements NetworkTestRepository {
  NetworkTestRepositoryImpl();

  @override
  Future<Either<ApiFailure, NetworkTestSuiteEntity>> runAllTests({
    void Function(NetworkTestEntity)? onTestComplete,
  }) async {
    return Left(ApiFailure.noInternet());
  }

  @override
  Future<Either<ApiFailure, NetworkTestEntity>> runTest(String testName) async {
    return Left(ApiFailure.noInternet());
  }
}
