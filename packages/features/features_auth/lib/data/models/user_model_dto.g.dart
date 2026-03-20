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
      factory: json['factory'] == null
          ? null
          : FactoryModelDto.fromJson(json['factory'] as Map<String, dynamic>),
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
