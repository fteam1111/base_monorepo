import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

/// Domain layer authentication token entity
class AuthTokenEntity extends Equatable {
  final JWT accessToken;
  final JWT refreshToken;
  final int expiresIn;

  const AuthTokenEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken, expiresIn];

  @override
  String toString() =>
      'AuthTokenEntity(accessToken: ${accessToken.getOrDefaultValue('').substring(0, 10)}...)';
}
