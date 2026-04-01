import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/domain/entities/parking_lot_entity.dart';
import 'package:features_parking_location/domain/repositories/parking_location_repository.dart';

class GetParkingLotsUseCase {
  GetParkingLotsUseCase(this._repository);

  final ParkingLocationRepository _repository;

  Future<Either<ApiFailure, List<ParkingLotEntity>>> call({
    required int page,
    required int size,
  }) {
    return _repository.getParkingLots(page: page, size: size);
  }
}
