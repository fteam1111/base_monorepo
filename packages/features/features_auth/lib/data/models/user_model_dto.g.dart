// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) =>
    _UserModelDto(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      isActive: json['isActive'] as bool,
      role: UserRoleModelDto.fromJson(json['role'] as Map<String, dynamic>),
      factory: json['factory'] as String?,
    );

Map<String, dynamic> _$UserModelDtoToJson(_UserModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'isActive': instance.isActive,
      'role': instance.role,
      'factory': instance.factory,
    };

_UserRoleModelDto _$UserRoleModelDtoFromJson(Map<String, dynamic> json) =>
    _UserRoleModelDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserRoleModelDtoToJson(_UserRoleModelDto instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
