import 'package:core/core.dart';
import 'package:features_auth/features_auth.dart';

extension UserMapper on UserModelDto {
  UserEntity toEntity() {
    final userRole = UserRole.fromApiName(role.name);
    final parsedRoleId = int.tryParse(userRole.id) ?? role.id;

    return UserEntity(
      id: IntegerValue(id.toString()),
      email: EmailVinAddress(email),
      fullName: StringValue(fullName),
      isActive: isActive,
      role: UserRoleEntity(id: parsedRoleId, name: userRole.apiName),
      factory: factory,
    );
  }
}
