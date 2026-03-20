import 'package:core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:features_auth/data/models/auth_token_dto.dart';
import 'package:features_auth/data/models/user_model_dto.dart';
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

  @GET(ApiRoutes.getUser)
  Future<BaseResponse<UserModelDto>> getCurrentUser();

  @GET(ApiRoutes.logout)
  Future<BaseResponse> logOut();
}
