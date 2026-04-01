import 'package:core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'vehicle_action_remote_datasource.g.dart';

/// Remote data source for vehicle actions (QC, Discharging) in features_vehicle.
@RestApi()
abstract class VehicleActionRemoteDataSource {
  factory VehicleActionRemoteDataSource(Dio dio, {String baseUrl}) =
      _VehicleActionRemoteDataSource;

  /// Sends a vehicle to the QC area.
  ///
  /// Calls `POST /api/v1/client/vehicles/{id}/send-to-qc`.
  @POST(ApiRoutes.sendVehicleToQc)
  Future<BaseResponse<dynamic>> sendVehicleToQc(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  /// Sends a vehicle for discharging.
  ///
  /// Calls `POST /api/v1/client/vehicles/{id}/send-for-discharging`.
  @POST(ApiRoutes.sendForDischarging)
  Future<BaseResponse<dynamic>> sendForDischarging(@Path('id') int id);
}
