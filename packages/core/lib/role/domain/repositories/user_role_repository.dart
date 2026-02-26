import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

/// Repository interface cho module Role dùng chung toàn app.
///
/// Triển khai cụ thể sẽ gọi vào API:
/// `/api/v1/client/roles?page=1&size=10`
abstract class UserRoleRepository {
  /// Trả về danh sách role (data) từ API.
  Future<Either<ApiFailure, List<UserRoleEntity>>> getClientRoles({
    int? page,
    int? size,
  });
}
