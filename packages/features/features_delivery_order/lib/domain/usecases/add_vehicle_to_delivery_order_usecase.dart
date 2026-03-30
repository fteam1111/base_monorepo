import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/repositories/delivery_order_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case: add a vehicle to a delivery order.
@injectable
class AddVehicleToDeliveryOrderUseCase {
  AddVehicleToDeliveryOrderUseCase(this._repository);

  final DeliveryOrderRepository _repository;

  Future<Either<ApiFailure, DeliveryOrderEntity>> call({
    required int deliveryOrderId,
    required String vehicleId,
  }) {
    return _repository.addVehicleToDeliveryOrder(
      deliveryOrderId: deliveryOrderId,
      vehicleId: vehicleId,
    );
  }
}
