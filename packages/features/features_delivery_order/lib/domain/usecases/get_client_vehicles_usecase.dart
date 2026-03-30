import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_delivery_order/domain/entities/client_vehicle_entity.dart';
import 'package:features_delivery_order/domain/repositories/delivery_order_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case: fetch paginated list of client vehicles for pick-up guidance.
@injectable
class GetClientVehiclesUseCase {
  GetClientVehiclesUseCase(this._repository);

  final DeliveryOrderRepository _repository;

  Future<Either<ApiFailure, List<ClientVehicleEntity>>> call({
    required int page,
    required int size,
    String? serialNumber,
    String? color,
    String? model,
    bool? isUnassigned,
  }) {
    return _repository.getClientVehicles(
      page: page,
      size: size,
      serialNumber: serialNumber,
      color: color,
      model: model,
      isUnassigned: isUnassigned,
    );
  }
}
