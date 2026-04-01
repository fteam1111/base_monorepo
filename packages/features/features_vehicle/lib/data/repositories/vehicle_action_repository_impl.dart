import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_vehicle/data/datasources/remote/vehicle_action_remote_datasource.dart';
import 'package:features_vehicle/domain/repositories/vehicle_action_repository.dart';

/// Implementation of [VehicleActionRepository].
class VehicleActionRepositoryImpl implements VehicleActionRepository {
  VehicleActionRepositoryImpl(this._remoteDataSource);

  final VehicleActionRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, Unit>> sendVehicleToQc({
    required int vehicleId,
    required String reason,
  }) async {
    try {
      await _remoteDataSource.sendVehicleToQc(vehicleId, {
        'description': reason,
      });
      return right(unit);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> sendForDischarging({
    required int vehicleId,
  }) async {
    try {
      await _remoteDataSource.sendForDischarging(vehicleId);
      return right(unit);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }
}
