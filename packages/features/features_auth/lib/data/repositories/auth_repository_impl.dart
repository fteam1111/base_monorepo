import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_auth/features_auth.dart';
import 'package:features_user/features_user.dart';
import 'package:local_storage/storage/token_storage.dart';

/// Implementation of AuthRepository
/// Connects domain layer with data sources
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource? _remoteDataSource;
  final TokenStorage _tokenStorage;

  AuthRepositoryImpl({
    AuthRemoteDataSource? remoteDataSource,
    required TokenStorage tokenStorage,
  }) : _remoteDataSource = remoteDataSource,

       _tokenStorage = tokenStorage {
    // Ensure at least one data source is provided
    assert(
      remoteDataSource != null,
      'Either remoteDataSource or mockDataSource must be provided',
    );
  }

  @override
  Future<Either<ApiFailure, AuthTokenEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final tokenModel = await _remoteDataSource!.login({
        'email': email,
        'password': password,
      });

      // Save tokens to storage
      await _tokenStorage.saveAccessToken(tokenModel.accessToken);
      await _tokenStorage.saveRefreshToken(tokenModel.refreshToken);

      return Right(tokenModel.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, AuthTokenEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final tokenModel = await _remoteDataSource!.register({
        'name': name,
        'email': email,
        'password': password,
      });

      // Save tokens to storage
      await _tokenStorage.saveAccessToken(tokenModel.accessToken);
      await _tokenStorage.saveRefreshToken(tokenModel.refreshToken);

      return Right(tokenModel.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, AuthTokenEntity>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final tokenModel = await _remoteDataSource!.refreshToken({
        'refresh_token': refreshToken,
      });

      // Save new tokens
      await _tokenStorage.saveAccessToken(tokenModel.accessToken);
      await _tokenStorage.saveRefreshToken(tokenModel.refreshToken);

      return Right(tokenModel.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, void>> logout() async {
    try {
      // Clear tokens from storage
      await _tokenStorage.clearTokens();

      return const Right(null);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, UserEntity>> getCurrentUser() async {
    try {
      final userModel = await _remoteDataSource!.getCurrentUser();

      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      return await _tokenStorage.isAuthenticated();
    } catch (_) {
      return false;
    }
  }
}
