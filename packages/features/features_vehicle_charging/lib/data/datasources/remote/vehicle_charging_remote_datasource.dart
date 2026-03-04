import 'package:core/model/base_pagination_response.dart';
import 'package:core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:features_vehicle_charging/data/models/vehicle_charging_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'vehicle_charging_remote_datasource.g.dart';

@RestApi()
@injectable
abstract class VehicleChargingRemoteDataSource {
  @factoryMethod
  factory VehicleChargingRemoteDataSource(
    Dio dio, {
    @Named('baseUrl') String? baseUrl,
  }) = _VehicleChargingRemoteDataSource;

  @GET(ApiRoutes.vehicles)
  Future<BasePaginationResponse<List<VehicleModelDto>>> getClientVehicles({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('serialNumber') String? serialNumber,
    @Query('factoryId') int? factoryId,
  });

  @POST(ApiRoutes.sendForDischarging)
  Future<BaseResponse<VehicleModelDto>> sendForDischarging(
    @Path('id') int vehicleId,
  );
}

