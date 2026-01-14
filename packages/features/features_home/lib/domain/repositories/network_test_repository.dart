import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../entities/network_test_entity.dart';

/// Repository interface for network testing operations
abstract class NetworkTestRepository {
  /// Run all network tests and return results
  /// [onTestComplete] callback is called after each individual test completes
  Future<Either<ApiFailure, NetworkTestSuiteEntity>> runAllTests({
    void Function(NetworkTestEntity)? onTestComplete,
  });

  /// Run a specific test by name
  Future<Either<ApiFailure, NetworkTestEntity>> runTest(String testName);
}
