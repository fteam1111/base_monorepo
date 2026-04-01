import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_vehicle/domain/repositories/vehicle_action_repository.dart';

/// Use case for sending a vehicle to QC area.
class SendVehicleToQcUseCase {
  SendVehicleToQcUseCase(this._repository);

  final VehicleActionRepository _repository;

  Future<Either<ApiFailure, Unit>> call({
    required int vehicleId,
    required String reason,
  }) {
    return _repository.sendVehicleToQc(vehicleId: vehicleId, reason: reason);
  }
}
