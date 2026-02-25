import 'package:core/core.dart';
import 'package:core/role/domain/entities/user_role_page_entity.dart';
import 'package:dartz/dartz.dart';

/// Repository interface cho module Role dùng chung toàn app.
///
/// Triển khai cụ thể sẽ gọi vào API:
/// `/api/v1/client/roles?page=1&size=10`
abstract class UserRoleRepository {
  Future<Either<ApiFailure, UserRolePageEntity>> getClientRoles({
    int page = 1,
    int size = 10,
  });
}

