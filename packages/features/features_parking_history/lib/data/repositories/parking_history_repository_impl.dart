import 'package:core/core.dart';
import 'package:core/model/base_pagination_response.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_history/data/datasources/remote/parking_history_remote_datasource.dart';
import 'package:features_parking_history/data/mappers/vehicle_history_mapper.dart';
import 'package:features_parking_history/domain/entities/vehicle_history_entity.dart';
import 'package:features_parking_history/domain/repositories/parking_history_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IParkingHistoryRepository)
class ParkingHistoryRepositoryImpl implements IParkingHistoryRepository {
  ParkingHistoryRepositoryImpl(this._remoteDataSource);

  final ParkingHistoryRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, Pagination<List<VehicleHistoryEntity>>>>
  getVehicleHistory(int vehicleId, int page, int size) async {
    try {
      final response = await _remoteDataSource.getVehicleHistory(
        vehicleId,
        page,
        size,
      );

      final paginationData = response.data;
      if (paginationData == null) {
        return left(const ApiFailure.other('Data is null'));
      }

      final entities =
          paginationData.data?.map((dto) => dto.toEntity()).toList() ?? [];

      final paginationEntity = Pagination<List<VehicleHistoryEntity>>(
        page: paginationData.page,
        size: paginationData.size,
        total: paginationData.total,
        totalPages: paginationData.totalPages,
        data: entities,
      );

      return right(paginationEntity);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }
}
