import 'package:core/core.dart';
import 'package:core/model/base_pagination_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:features_parking_history/domain/entities/vehicle_history_entity.dart';
import 'package:features_parking_history/domain/repositories/parking_history_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVehicleHistoriesUseCase {
  const GetVehicleHistoriesUseCase(this._repository);
  final IParkingHistoryRepository _repository;

  Future<Either<ApiFailure, Pagination<List<VehicleHistoryEntity>>>> call(
    GetVehicleHistoriesParams params,
  ) {
    return _repository.getVehicleHistory(
      params.vehicleId,
      params.page,
      params.size,
    );
  }
}

class GetVehicleHistoriesParams extends Equatable {
  const GetVehicleHistoriesParams({
    required this.vehicleId,
    required this.page,
    required this.size,
  });

  final int vehicleId;
  final int page;
  final int size;

  @override
  List<Object?> get props => [vehicleId, page, size];
}
