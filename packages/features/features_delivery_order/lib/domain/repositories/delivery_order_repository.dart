import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_vehicle_entity.dart';

/// Repository interface for Delivery Order operations.
abstract class DeliveryOrderRepository {
  /// Fetches paginated list of delivery orders.
  Future<Either<ApiFailure, List<DeliveryOrderEntity>>> getDeliveryOrders({
    required int page,
    required int size,
    String? status,
  });

  /// Fetches list of vehicles assigned to a delivery order.
  Future<Either<ApiFailure, List<DeliveryOrderVehicleEntity>>>
  getDeliveryOrderVehicles({required int deliveryOrderId});

  /// Adds a vehicle to a delivery order. Returns updated DO.
  Future<Either<ApiFailure, DeliveryOrderEntity>> addVehicleToDeliveryOrder({
    required int deliveryOrderId,
    required String vehicleId,
  });
}
