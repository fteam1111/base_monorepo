import 'package:core/core.dart';
import 'package:core/role/data/models/user_role_page_dto.dart';
import 'package:core/role/domain/entities/user_role_page_entity.dart';

extension UserRolePageMapper on UserRolePageDto {
  UserRolePageEntity toEntity() {
    return UserRolePageEntity(
      total: total,
      page: page,
      size: size,
      totalPages: totalPages,
      roles: data
          .map(
            (item) => UserRole.fromApiName(item.name),
          )
          .toList(),
    );
  }
}

