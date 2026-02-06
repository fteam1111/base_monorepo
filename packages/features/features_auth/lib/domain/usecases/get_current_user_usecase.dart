import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_auth/features_auth.dart';

/// Use case to get current authenticated user
class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Either<ApiFailure, UserEntity>> call() {
    return repository.getCurrentUser();
  }
}
