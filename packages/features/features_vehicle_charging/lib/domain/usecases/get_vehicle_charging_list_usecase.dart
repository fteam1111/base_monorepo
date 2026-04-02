import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';
import 'package:features_vehicle_charging/domain/repositories/vehicle_charging_repository.dart';

import 'package:injectable/injectable.dart';

@injectable
class GetVehicleChargingListUseCase {
  GetVehicleChargingListUseCase(this._repository);

  final VehicleChargingRepository _repository;

  Future<Either<ApiFailure, List<VehicleChargingEntity>>> call({
    required int page,
    required int size,
    String? serialNumber,
    int? factoryId,
  }) {
    return _repository.getClientVehicles(
      page: page,
      size: size,
      serialNumber: serialNumber,
      factoryId: factoryId,
    );
  }
}
