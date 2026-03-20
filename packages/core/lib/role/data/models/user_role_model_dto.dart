import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_model_dto.freezed.dart';
part 'user_role_model_dto.g.dart';

@freezed
abstract class UserRoleModelDto with _$UserRoleModelDto {
  const factory UserRoleModelDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
  }) = _UserRoleModelDto;

  factory UserRoleModelDto.fromJson(Map<String, Object?> json) =>
      _$UserRoleModelDtoFromJson(json);
}