import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_model_dto.freezed.dart';
part 'user_role_model_dto.g.dart';

@freezed
abstract class UserRoleModelDto with _$UserRoleModelDto {
  const factory UserRoleModelDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _UserRoleModelDto;

  factory UserRoleModelDto.fromJson(Map<String, Object?> json) =>
      _$UserRoleModelDtoFromJson(json);
}