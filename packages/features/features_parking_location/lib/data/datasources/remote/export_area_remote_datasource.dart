import 'package:core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:features_parking_location/data/models/available_export_area_dto.dart';
import 'package:features_parking_location/data/models/export_add_vehicle_to_do_request_dto.dart';
import 'package:features_parking_location/data/models/export_area_delivery_order_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'export_area_remote_datasource.g.dart';

@RestApi()
abstract class ExportAreaRemoteDataSource {
  factory ExportAreaRemoteDataSource(Dio dio) = _ExportAreaRemoteDataSource;

  @GET(ApiRoutes.exportAreasAvailable)
  Future<BaseResponse<List<AvailableExportAreaDto>>> getAvailableExportAreas(
    @Query('factoryId') int factoryId,
  );

  @GET(ApiRoutes.exportAreaDeliveryOrders)
  Future<BaseResponse<List<ExportAreaDeliveryOrderDto>>>
  getExportAreaDeliveryOrders(@Path('exportAreaId') int areaId);

  @POST(ApiRoutes.deliveryOrderVehicles)
  Future<BaseResponse<dynamic>> addVehicleToDeliveryOrder(
    @Path('deliveryOrderId') int doId,
    @Body() ExportAddVehicleToDoRequestDto body,
  );
}
