import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model_dto.freezed.dart';
part 'user_model_dto.g.dart';

@Freezed(toJson: true)
abstract class UserModelDto with _$UserModelDto {
  const factory UserModelDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'role') UserRoleModelDto? role,
    @JsonKey(name: 'factory') FactoryModelDto? factory,
  }) = _UserModelDto;

  factory UserModelDto.fromJson(Map<String, Object?> json) =>
      _$UserModelDtoFromJson(json);
}
