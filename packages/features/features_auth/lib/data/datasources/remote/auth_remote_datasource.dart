import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:features_auth/features_auth.dart';
import 'package:features_user/features_user.dart';
import 'package:share/routes/api_routes.dart';

part 'auth_remote_datasource.g.dart';

/// Remote data source for authentication operations using Retrofit
@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) = _AuthRemoteDataSource;

  @POST(ApiRoutes.login)
  Future<AuthTokenModel> login(@Body() Map<String, dynamic> body);

  @POST(ApiRoutes.register)
  Future<AuthTokenModel> register(@Body() Map<String, dynamic> body);

  @POST(ApiRoutes.refreshToken)
  Future<AuthTokenModel> refreshToken(@Body() Map<String, dynamic> body);

  @GET(ApiRoutes.getUser)
  Future<UserModel> getCurrentUser();
}
