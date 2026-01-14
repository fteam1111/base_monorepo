import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:features_user/features_user.dart';
import 'package:share/routes/api_routes.dart';

part 'user_remote_datasource.g.dart';

/// Remote data source for user operations using Retrofit
@RestApi()
abstract class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio, {String baseUrl}) = _UserRemoteDataSource;

  @GET('${ApiRoutes.getUser}/{id}')
  Future<UserModel> getUserById(@Path('id') String id);

  @PUT('${ApiRoutes.getUser}/{id}')
  Future<UserModel> updateUser(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('${ApiRoutes.getUser}/{id}')
  Future<void> deleteUser(@Path('id') String id);

  @GET(ApiRoutes.getUsers)
  Future<List<UserModel>> getUsers(@Queries() Map<String, dynamic> queries);
}
