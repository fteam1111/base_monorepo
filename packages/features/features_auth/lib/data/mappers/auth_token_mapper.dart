import 'package:core/core.dart';
import 'package:features_auth/features_auth.dart';

extension AuthTokenDtoMapper on AuthTokenDto {
  AuthTokenEntity toEntity() {
    return AuthTokenEntity(
      accessToken: JWT(accessToken),
      refreshToken: JWT(refreshToken),
      expiresIn: expiresIn ?? 0,
    );
  }
}
