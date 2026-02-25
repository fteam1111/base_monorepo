// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoleItemDto _$UserRoleItemDtoFromJson(Map<String, dynamic> json) =>
    UserRoleItemDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

UserRolePageDto _$UserRolePageDtoFromJson(Map<String, dynamic> json) =>
    UserRolePageDto(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => UserRoleItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
