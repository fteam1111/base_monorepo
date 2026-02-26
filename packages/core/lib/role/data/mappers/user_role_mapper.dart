import 'package:core/role/data/models/user_role_model_dto.dart';
import 'package:core/role/domain/entities/user_role_entity.dart';

extension UserRoleMapper on UserRoleModelDto {
  UserRoleEntity toEntity() {
    return UserRoleEntity(
      id: id,
      name: name,
    );
  }
}

