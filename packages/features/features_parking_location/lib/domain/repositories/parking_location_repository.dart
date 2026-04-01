import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/domain/entities/parking_lot_entity.dart';
import 'package:features_parking_location/domain/entities/parking_vehicle_entity.dart';

abstract class ParkingLocationRepository {
  Future<Either<ApiFailure, List<ParkingLotEntity>>> getParkingLots({
    required int page,
    required int size,
  });

  Future<Either<ApiFailure, Unit>> addVehicleToParkingLot({
    required int lotId,
    required int vehicleId,
  });

  Future<Either<ApiFailure, List<ParkingVehicleEntity>>> getVehiclesByStatus({
    required int status,
    required int page,
    required int size,
  });
}
