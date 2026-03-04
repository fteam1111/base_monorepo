import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';

/// Repository interface for vehicle-related operations.
abstract interface class VehicleRepository {
  /// Fetches a vehicle by its serial number.
  ///
  /// Returns [Right] with [VehicleEntity] on success,
  /// or [Left] with [ApiFailure] on failure.
  Future<Either<ApiFailure, VehicleEntity>> getVehicleBySerial(
    String serialNumber,
  );
}
