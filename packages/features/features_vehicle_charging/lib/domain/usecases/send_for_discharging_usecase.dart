import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';
import 'package:features_vehicle_charging/domain/repositories/vehicle_charging_repository.dart';

import 'package:injectable/injectable.dart';

@injectable
class SendForDischargingUseCase {
  SendForDischargingUseCase(this._repository);

  final VehicleChargingRepository _repository;

  Future<Either<ApiFailure, VehicleChargingEntity>> call({
    required int vehicleId,
  }) {
    return _repository.sendForDischarging(vehicleId: vehicleId);
  }
}
