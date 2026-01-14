import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:features_user/features_user.dart';

/// Repository interface for user operations
abstract class UserRepository {
  /// Get user by ID
  Future<Either<ApiFailure, UserEntity>> getUserById(String id);

  /// Update user profile
  Future<Either<ApiFailure, UserEntity>> updateUser({
    required String id,
    String? name,
    String? email,
    String? avatar,
  });

  /// Delete user
  Future<Either<ApiFailure, void>> deleteUser(String id);

  /// Get list of users (with pagination)
  Future<Either<ApiFailure, List<UserEntity>>> getUsers({
    int page = 1,
    int limit = 20,
  });
}
