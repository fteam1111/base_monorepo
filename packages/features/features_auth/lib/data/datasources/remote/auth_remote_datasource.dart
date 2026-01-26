import 'package:dio/dio.dart';
import 'package:features_auth/data/models/user_model.dart';
import 'package:features_auth/features_auth.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'auth_remote_datasource.g.dart';

/// Remote data source for authentication operations using Retrofit
@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSource;

  @POST(ApiRoutes.login)
  Future<AuthTokenDto> login(@Body() Map<String, dynamic> body);

  @GET(ApiRoutes.loginForTest)
  Future<String> loginForTest();

  @POST(ApiRoutes.refreshToken)
  Future<AuthTokenDto> refreshToken(@Body() Map<String, dynamic> body);

  @GET(ApiRoutes.getUser)
  Future<UserModel> getCurrentUser();
}
