import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/domain/entities/parking_vehicle_entity.dart';
import 'package:features_parking_location/domain/repositories/parking_location_repository.dart';

class GetParkingVehiclesParams {
  const GetParkingVehiclesParams({
    required this.status,
    required this.page,
    required this.size,
  });

  final int status;
  final int page;
  final int size;
}

class GetParkingVehiclesUseCase {
  const GetParkingVehiclesUseCase(this._repository);

  final ParkingLocationRepository _repository;

  Future<Either<ApiFailure, List<ParkingVehicleEntity>>> call(
    GetParkingVehiclesParams params,
  ) {
    return _repository.getVehiclesByStatus(
      status: params.status,
      page: params.page,
      size: params.size,
    );
  }
}
