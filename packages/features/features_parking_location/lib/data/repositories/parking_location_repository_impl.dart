import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/data/datasources/remote/parking_location_remote_datasource.dart';
import 'package:features_parking_location/data/mappers/parking_lot_mapper.dart';
import 'package:features_parking_location/data/mappers/parking_vehicle_mapper.dart';
import 'package:features_parking_location/domain/entities/parking_lot_entity.dart';
import 'package:features_parking_location/domain/entities/parking_vehicle_entity.dart';
import 'package:features_parking_location/domain/repositories/parking_location_repository.dart';

class ParkingLocationRepositoryImpl implements ParkingLocationRepository {
  const ParkingLocationRepositoryImpl(this._remoteDataSource);

  final ParkingLocationRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, List<ParkingLotEntity>>> getParkingLots({
    required int page,
    required int size,
  }) async {
    try {
      final response = await _remoteDataSource.getParkingLots(
        page: page,
        size: size,
      );

      final paginationData = response.data;
      if (paginationData == null) {
        return left(const ApiFailure.serverError('No data available'));
      }

      final entities =
          paginationData.data?.map((dto) => dto.toEntity()).toList() ?? [];

      return right(entities);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> addVehicleToParkingLot({
    required int lotId,
    required int vehicleId,
  }) async {
    try {
      await _remoteDataSource.addVehicleToParkingLot(
        lotId: lotId,
        body: {'vehicleId': vehicleId},
      );
      return right(unit);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, List<ParkingVehicleEntity>>> getVehiclesByStatus({
    required int status,
    required int page,
    required int size,
  }) async {
    try {
      final response = await _remoteDataSource.getVehiclesByStatus(
        status: status,
        page: page,
        size: size,
      );

      final paginationData = response.data;
      if (paginationData == null) {
        return left(const ApiFailure.serverError('No data available'));
      }

      final entities =
          paginationData.data?.map((dto) => dto.toEntity()).toList() ?? [];

      return right(entities);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }
}
