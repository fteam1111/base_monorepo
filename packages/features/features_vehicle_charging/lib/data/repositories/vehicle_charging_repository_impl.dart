import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_vehicle_charging/features_vehicle_charging.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: VehicleChargingRepository)
class VehicleChargingRepositoryImpl implements VehicleChargingRepository {
  VehicleChargingRepositoryImpl(this._remoteDataSource);

  final VehicleChargingRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, List<VehicleChargingEntity>>> getClientVehicles({
    required int page,
    required int size,
    String? serialNumber,
    int? factoryId,
  }) async {
    try {
      final response = await _remoteDataSource.getClientVehicles(
        page: page,
        size: size,
        serialNumber: serialNumber,
        factoryId: factoryId,
      );

      final pagination = response.data;
      final items = pagination?.data;

      if (items == null || items.isEmpty) {
        return const Right([]);
      }

      final entities = items.map((dto) => dto.toEntity()).toList();

      return Right(entities);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, VehicleChargingEntity>> sendForDischarging({
    required int vehicleId,
  }) async {
    try {
      final response = await _remoteDataSource.sendForDischarging(vehicleId);
      final data = response.data;
      if (data == null) {
        return const Left(ApiFailure.other('Vehicle not found'));
      }
      return Right(data.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }
}
