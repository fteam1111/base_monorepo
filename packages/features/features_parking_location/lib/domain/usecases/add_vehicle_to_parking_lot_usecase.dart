import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/domain/repositories/parking_location_repository.dart';

class AddVehicleToParkingLotUseCase {
  AddVehicleToParkingLotUseCase(this._repository);

  final ParkingLocationRepository _repository;

  Future<Either<ApiFailure, Unit>> call({
    required int lotId,
    required int vehicleId,
  }) {
    return _repository.addVehicleToParkingLot(
      lotId: lotId,
      vehicleId: vehicleId,
    );
  }
}
