import 'package:core/core.dart';
import 'package:features_auth/features_auth.dart';

extension UserMapper on UserModelDto {
  UserEntity toEntity() {
    return UserEntity(
      id: IntegerValue((id ?? 0).toString()),
      email: EmailVinAddress(email ?? ''),
      fullName: StringValue(fullName ?? ''),
      isActive: isActive ?? false,
      role: role?.toEntity() ?? const UserRoleEntity(id: 0, name: ''),
      factory: factory?.toEntity(),
    );
  }
}
