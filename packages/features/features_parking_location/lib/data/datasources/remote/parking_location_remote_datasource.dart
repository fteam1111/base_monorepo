import 'package:core/model/base_pagination_response.dart';
import 'package:core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:features_parking_location/data/models/parking_lot_dto.dart';
import 'package:features_parking_location/data/models/parking_vehicle_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/share.dart';

part 'parking_location_remote_datasource.g.dart';

@RestApi()
abstract class ParkingLocationRemoteDataSource {
  factory ParkingLocationRemoteDataSource(Dio dio) =
      _ParkingLocationRemoteDataSource;

  @GET(ApiRoutes.parkingLots)
  Future<BasePaginationResponse<List<ParkingLotDto>>> getParkingLots({
    @Query('page') required int page,
    @Query('size') required int size,
  });

  @POST('${ApiRoutes.parkingLots}/{id}/vehicles')
  Future<BaseResponse<dynamic>> addVehicleToParkingLot({
    @Path('id') required int lotId,
    @Body() required Map<String, dynamic> body,
  });

  @GET(ApiRoutes.vehicles)
  Future<BasePaginationResponse<List<ParkingVehicleDto>>> getVehiclesByStatus({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('status') required int status,
  });
}
