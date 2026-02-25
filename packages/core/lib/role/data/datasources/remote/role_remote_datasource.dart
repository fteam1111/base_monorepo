import 'package:core/model/base_response.dart';
import 'package:core/role/data/models/user_role_page_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'role_remote_datasource.g.dart';

/// Remote data source cho module Role (dùng chung toàn app) dùng Retrofit.
///
/// Gọi API:
/// `/api/v1/client/roles?page=1&size=10`
@RestApi()
abstract class RoleRemoteDataSource {
  factory RoleRemoteDataSource(Dio dio, {String baseUrl}) =
      _RoleRemoteDataSource;

  @GET(ApiRoutes.getClientRoles)
  Future<BaseResponse<UserRolePageDto>> getClientRoles({
    @Query('page') int page = 1,
    @Query('size') int size = 10,
  });
}

