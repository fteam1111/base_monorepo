import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_vehicle/domain/repositories/vehicle_action_repository.dart';

/// Use case for sending a vehicle to charging/discharging area.
class VehicleActionSendForDischargingUseCase {
  VehicleActionSendForDischargingUseCase(this._repository);

  final VehicleActionRepository _repository;

  Future<Either<ApiFailure, Unit>> call({required int vehicleId}) {
    return _repository.sendForDischarging(vehicleId: vehicleId);
  }
}
