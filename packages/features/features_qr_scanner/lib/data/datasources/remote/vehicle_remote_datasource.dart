import 'package:core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:features_qr_scanner/data/models/vehicle_model_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'vehicle_remote_datasource.g.dart';

/// Remote data source for vehicle API using Retrofit.
@RestApi()
abstract class VehicleRemoteDataSource {
  factory VehicleRemoteDataSource(Dio dio, {String baseUrl}) =
      _VehicleRemoteDataSource;

  /// Fetches vehicle information by serial number.
  ///
  /// Calls `GET /api/v1/client/vehicles/by-serial/{serialNumber}`.
  @GET(ApiRoutes.vehicleBySerial)
  Future<BaseResponse<VehicleDto>> getVehicleBySerial(
    @Path('serialNumber') String serialNumber,
  );
}
