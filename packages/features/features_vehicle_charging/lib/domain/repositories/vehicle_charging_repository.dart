import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';

abstract class VehicleChargingRepository {
  Future<Either<ApiFailure, List<VehicleChargingEntity>>> getClientVehicles({
    required int page,
    required int size,
    String? serialNumber,
    int? factoryId,
  });

  Future<Either<ApiFailure, VehicleChargingEntity>> sendForDischarging({
    required int vehicleId,
  });
}

