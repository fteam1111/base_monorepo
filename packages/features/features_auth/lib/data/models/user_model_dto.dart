import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model_dto.freezed.dart';
part 'user_model_dto.g.dart';


@freezed
abstract class UserModelDto with _$UserModelDto {
  const factory UserModelDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'isActive') required bool isActive,
    @JsonKey(name: 'role') required UserRoleModelDto role,
    @JsonKey(name: 'factory') String? factory,
  }) = _UserModelDto;

  factory UserModelDto.fromJson(Map<String, Object?> json) =>
      _$UserModelDtoFromJson(json);
}

@freezed
abstract class UserRoleModelDto with _$UserRoleModelDto {
  const factory UserRoleModelDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
  }) = _UserRoleModelDto;

  factory UserRoleModelDto.fromJson(Map<String, Object?> json) =>
      _$UserRoleModelDtoFromJson(json);
}

