import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_vehicle_entity.dart';
import 'package:features_delivery_order/domain/repositories/delivery_order_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case: fetch vehicles assigned to a specific delivery order.
@injectable
class GetDeliveryOrderVehiclesUseCase {
  GetDeliveryOrderVehiclesUseCase(this._repository);

  final DeliveryOrderRepository _repository;

  Future<Either<ApiFailure, List<DeliveryOrderVehicleEntity>>> call({
    required int deliveryOrderId,
  }) {
    return _repository.getDeliveryOrderVehicles(
      deliveryOrderId: deliveryOrderId,
    );
  }
}
