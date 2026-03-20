import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_qr_scanner/data/datasources/remote/vehicle_remote_datasource.dart';
import 'package:features_qr_scanner/data/mappers/vehicle_mapper.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:features_qr_scanner/domain/repositories/vehicle_repository.dart';

/// Implementation of [VehicleRepository].
class VehicleRepositoryImpl implements VehicleRepository {
  VehicleRepositoryImpl(this._dataSource);

  final VehicleRemoteDataSource _dataSource;

  @override
  Future<Either<ApiFailure, VehicleEntity>> getVehicleBySerial(
    String serialNumber,
  ) async {
    try {
      final result = await _dataSource.getVehicleBySerial(serialNumber);
      final data = result.data;
      if (data == null) {
        return const Left(ApiFailure.other('Vehicle not found'));
      }
      return Right(data.toEntity());
    } on Exception catch (e, s) {
      logger.e(
        'Error fetching vehicle: $serialNumber',
        error: e,
        stackTrace: s,
      );
      return Left(e.toApiFailure());
    }
  }
}
