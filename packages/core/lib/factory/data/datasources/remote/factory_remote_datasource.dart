import 'package:core/model/base_response.dart';
import 'package:core/factory/data/models/factory_model_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'factory_remote_datasource.g.dart';

/// Remote data source cho module Factory (dùng chung toàn app) dùng Retrofit.
///
/// Gọi API:
/// `/api/v1/client/factories`
@RestApi()
abstract class FactoryRemoteDataSource {
  factory FactoryRemoteDataSource(Dio dio, {String baseUrl}) =
      _FactoryRemoteDataSource;

  @GET(ApiRoutes.getFactories)
  Future<BaseResponse<List<FactoryModelDto>>> getClientFactories();
}

