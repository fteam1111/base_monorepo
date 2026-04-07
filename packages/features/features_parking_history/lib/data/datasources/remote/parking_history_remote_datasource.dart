import 'package:core/model/base_pagination_response.dart';
import 'package:dio/dio.dart';
import 'package:features_parking_history/data/models/vehicle_history_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'parking_history_remote_datasource.g.dart';

@RestApi()
abstract class ParkingHistoryRemoteDataSource {
  factory ParkingHistoryRemoteDataSource(Dio dio) =
      _ParkingHistoryRemoteDataSource;

  @GET(ApiRoutes.vehicleHistory)
  Future<BasePaginationResponse<List<VehicleHistoryDto>>> getVehicleHistory(
    @Path('id') int vehicleId,
    @Query('page') int page,
    @Query('size') int size,
  );
}
