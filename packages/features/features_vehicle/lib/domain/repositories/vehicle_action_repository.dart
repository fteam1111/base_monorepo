import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

/// Repository interface for vehicle actions handled within features_vehicle.
abstract class VehicleActionRepository {
  /// Sends the vehicle to QC area with a reason.
  Future<Either<ApiFailure, Unit>> sendVehicleToQc({
    required int vehicleId,
    required String reason,
  });

  /// Sends the vehicle for charging/discharging.
  Future<Either<ApiFailure, Unit>> sendForDischarging({required int vehicleId});
}
