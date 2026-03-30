import 'package:core/model/base_pagination_response.dart';
import 'package:core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:features_delivery_order/data/models/client_vehicle_dto.dart';
import 'package:features_delivery_order/data/models/delivery_order_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';

part 'delivery_order_remote_datasource.g.dart';

/// Remote data source for Delivery Order Client APIs.
@RestApi()
@injectable
abstract class DeliveryOrderRemoteDataSource {
  @factoryMethod
  factory DeliveryOrderRemoteDataSource(
    Dio dio, {
    @Named('baseUrl') String? baseUrl,
  }) = _DeliveryOrderRemoteDataSource;

  /// GET /api/v1/client/delivery-orders
  @GET(ApiRoutes.deliveryOrders)
  Future<BasePaginationResponse<List<DeliveryOrderDto>>> getDeliveryOrders({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('status') String? status,
  });

  /// GET /api/v1/client/delivery-orders/{deliveryOrderId}/vehicles
  @GET(ApiRoutes.deliveryOrderVehicles)
  Future<BaseResponse<List<DeliveryOrderVehicleDto>>> getDeliveryOrderVehicles(
    @Path('deliveryOrderId') int deliveryOrderId,
  );

  /// POST /api/v1/client/delivery-orders/{deliveryOrderId}/vehicles
  @POST(ApiRoutes.deliveryOrderVehicles)
  Future<BaseResponse<DeliveryOrderDto>> addVehicleToDeliveryOrder(
    @Path('deliveryOrderId') int deliveryOrderId,
    @Body() AddVehicleToDeliveryOrderRequestDto body,
  );

  /// GET /api/v1/client/vehicles
  @GET(ApiRoutes.vehicles)
  Future<BasePaginationResponse<List<ClientVehicleDto>>> getClientVehicles({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('serialNumber') String? serialNumber,
    @Query('color') String? color,
    @Query('model') String? model,
    @Query('isUnassigned') bool? isUnassigned,
  });
}
