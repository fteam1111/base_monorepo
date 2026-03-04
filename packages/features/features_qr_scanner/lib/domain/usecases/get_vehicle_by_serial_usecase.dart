import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:features_qr_scanner/domain/repositories/vehicle_repository.dart';

/// Use case for fetching a vehicle by its serial number.
class GetVehicleBySerialUseCase {
  GetVehicleBySerialUseCase(this._repository);

  final VehicleRepository _repository;

  /// Executes the use case.
  ///
  /// [serialNumber] the vehicle's serial/VIN number.
  Future<Either<ApiFailure, VehicleEntity>> call(String serialNumber) =>
      _repository.getVehicleBySerial(serialNumber);
}
