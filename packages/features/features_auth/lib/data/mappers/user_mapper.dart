import 'package:core/core.dart';
import 'package:features_auth/domain/value/value_object.dart';
import 'package:features_auth/features_auth.dart';

extension UserMapper on UserModelDto {
  UserEntity toEntity() {
    return UserEntity(
      id: IntegerValue(id.toString()),
      email: EmailAddress(email),
      fullName: StringValue(fullName),
      isActive: isActive,
      role: UserRoleEntity(id: role.id, name: role.name),
      factory: factory,
    );
  }
}
