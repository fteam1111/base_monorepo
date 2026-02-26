import 'package:core/model/base_pagination_response.dart';
import 'package:core/role/data/models/user_role_model_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'role_remote_datasource.g.dart';

/// Remote data source cho module Role (dùng chung toàn app) dùng Retrofit.
///
/// Gọi API:
/// `/api/v1/client/roles?page=1&size999`
@RestApi()
abstract class RoleRemoteDataSource {
  factory RoleRemoteDataSource(Dio dio, {String baseUrl}) =
      _RoleRemoteDataSource;

  @GET(ApiRoutes.getRoles)
  Future<BasePaginationResponse<List<UserRoleModelDto>>> getClientRoles({
    @Query('page') int? page = 1,
    @Query('size') int? size = 999,
  });
}

