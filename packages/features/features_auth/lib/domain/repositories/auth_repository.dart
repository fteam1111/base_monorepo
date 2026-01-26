import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_auth/domain/entities/user_entity.dart';
import 'package:features_auth/features_auth.dart';

/// Repository interface for authentication operations
/// Domain layer defines the contract, Data layer implements it
abstract class AuthRepository {
  /// Login with email and password
  Future<Either<ApiFailure, AuthTokenEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<ApiFailure, AuthTokenEntity>> loginForTest();

  /// Refresh access token
  Future<Either<ApiFailure, AuthTokenEntity>> refreshToken({
    required String refreshToken,
  });

  /// Logout and clear tokens
  Future<Either<ApiFailure, void>> logout();

  /// Get currently authenticated user
  Future<Either<ApiFailure, UserEntity>> getCurrentUser();

  /// Check if user is authenticated
  Future<bool> isAuthenticated();
}
