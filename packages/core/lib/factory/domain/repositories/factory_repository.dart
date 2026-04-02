import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

/// Repository interface cho module Factory dùng chung toàn app.
///
/// Triển khai cụ thể sẽ gọi vào API:
/// `/api/v1/client/factories`
abstract class FactoryRepository {
  /// Trả về danh sách nhà máy (factory) từ API.
  Future<Either<ApiFailure, List<FactoryEntity>>> getClientFactories();
}
