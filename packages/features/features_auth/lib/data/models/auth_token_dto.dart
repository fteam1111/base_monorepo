import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token_dto.freezed.dart';

part 'auth_token_dto.g.dart';

@freezed
abstract class AuthTokenDto with _$AuthTokenDto {
  const factory AuthTokenDto({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_in') int? expiresIn,
  }) = _AuthTokenDto;

  factory AuthTokenDto.fromJson(Map<String, Object?> json) =>
      _$AuthTokenDtoFromJson(json);
}
