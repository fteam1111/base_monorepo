import 'dart:convert';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_auth/features_auth.dart';
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

      final entity = tokenModel.toEntity();

      // Save tokens to storage
      await _tokenStorage.saveAccessToken(entity.accessToken.getValue());
      await _tokenStorage.saveRefreshToken(entity.refreshToken.getValue());

      return Right(entity);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, AuthTokenEntity>> loginForTest() async {
    try {
      final html = await _remoteDataSource!.loginForTest();

      final jsonString = _extractJsonFromHtml(html);
      final map = jsonDecode(jsonString) as Map<String, dynamic>;

      final accessToken = map['accessToken'] as String;
      final expiresIn = map['expiresInSeconds'] as int;

      final entity = AuthTokenEntity(
        accessToken: JWT(accessToken),
        refreshToken: JWT(accessToken),
        expiresIn: expiresIn,
      );

      await _tokenStorage.saveAccessToken(
        entity.accessToken.getOrDefaultValue(''),
      );
      await _tokenStorage.saveRefreshToken(
        entity.refreshToken.getOrDefaultValue(''),
      );

      return Right(entity);
    } catch (e) {
      return Left(e.toApiFailure());
    }
  }

  String _extractJsonFromHtml(String html) {
    final preMatch = RegExp(
      r'<pre>([\s\S]*?)<\/pre>',
      caseSensitive: false,
    ).firstMatch(html);

    final candidate = preMatch?.group(1) ?? html;

    // Fallback: find the first JSON object in the candidate.
    final jsonMatch = RegExp(
      r'\{[\s\S]*?\}',
      multiLine: true,
    ).firstMatch(candidate);

    if (jsonMatch == null) {
      throw Exception('Invalid token html response');
    }

    return jsonMatch.group(0)!;
  }

  @override
  Future<Either<ApiFailure, AuthTokenEntity>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final tokenModel = await _remoteDataSource!.refreshToken({
        'refresh_token': refreshToken,
      });

      final entity = tokenModel.toEntity();

      // Save new tokens
      await _tokenStorage.saveAccessToken(entity.accessToken.getValue());
      await _tokenStorage.saveRefreshToken(entity.refreshToken.getValue());

      return Right(entity);
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
      final result = await _remoteDataSource!.getCurrentUser();

      final data = result.data;
      if (data == null) {
        return const Left(ApiFailure.userNotFound());
      }

      return Right(data.toEntity());
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
